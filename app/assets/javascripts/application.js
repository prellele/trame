//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datetimepicker
//= require bootstrap-flashmessage
//= require moment
//= require highcharts
//= require date
//= require bootstrapSwitch
//= require donuts
//= require daterangepicker
//= require turbolinks
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

    $('#home_navtab a').click(function (e) {
      e.preventDefault();
      $(this).tab('show');
    });

});

