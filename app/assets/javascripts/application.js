//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datetimepicker
//= require bootstrap-flashmessage
//= require moment
//= require highcharts
//= require bootstrapSwitch
//= require donuts
//= require daterangepicker
//= require_tree .

$(document).ready(function () {
    $('time').tooltip();
    $('span').tooltip();
    $(".collapse").collapse();

    $('#datetimepicker').datetimepicker({
      pickSeconds: false
    });    
    
    $('#datetimepicker2').datetimepicker({
      pickSeconds: false
    });
    $('#datepicker').datetimepicker({
      pickTime: false
    });

    $('#home_navtab a').click(function (e) {
      e.preventDefault();
      $(this).tab('show');
    });

    $(":submit").click(function () {
      copyTextToHiddenInputs(this);
    });

    $('select[data-dynamic-selectable-url][data-dynamic-selectable-target]').dynamicSelectable();

});

function copyTextToHiddenInputs(element) {
  if ($('.containsdaterange').length) {
    $(".selectbox").each(function( index ) {
      var input_id = this.id.substr(0,(this.id.length-3));
      $("#"+input_id).val(jQuery.trim($(this).text()));
    });
  }
}

