//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datetimepicker
//= require moment
//= require highcharts
//= require date
//= require bootstrapSwitch
//= require donuts
//= require daterangepicker
//= require_tree .

$(document).ready(function () {
    $('time').tooltip();
    $('span').tooltip();
    $(".collapse").collapse();
    $('.alert').delay(10000).slideUp(800);

    $('#datetimepicker').datetimepicker({
      pickSeconds: false
    });

    $('#home_navtab a').click(function (e) {
      e.preventDefault();
      $(this).tab('show');
    });

});