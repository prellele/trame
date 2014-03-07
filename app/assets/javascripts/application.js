//= require jquery_ujs
//= require foundation
//= require moment
//= require highcharts
//= require donuts
//= require_tree .

$(document).ready(function () {
    $('#home_navtab a').click(function (e) {
      e.preventDefault();
      $(this).tab('show');
    });

    $(":submit").click(function () {
      copyTextToHiddenInputs(this);
    });

    $('select[data-dynamic-selectable-url][data-dynamic-selectable-target]').dynamicSelectable();

    $(document).foundation();

});

function copyTextToHiddenInputs(element) {
  if ($('.containsdaterange').length) {
    $(".selectbox").each(function( index ) {
      var input_id = this.id.substr(0,(this.id.length-3));
      $("#"+input_id).val(jQuery.trim($(this).text()));
    });
  }
}



