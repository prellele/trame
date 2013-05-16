$(document).ready(function () {
  $("#tracking_start_time").on("change", function() { 
    var date = $(this).val(); 
    if (moment(date, $(this).data('format-moment'))) { 
      recalculateEndDate(date); 
    }
  });
  $("#datetimepicker").on("changeDate", function() { 
    var date = $(this).find('input').val(); 
    if (moment(date, $(this).data('format-moment'))) { 
      recalculateEndDate(date); 
    }
  });
  $("#datetimepicker").on("show", function() { 
    var date = $(this).find('input').val(); 
    if (moment(date, $(this).data('format-moment'))) { 
      recalculateEndDate(date); 
    }
  });
  $("#tracking_minutes").on("change", function() { 
    var date = $(this).val(); 
    recalculateEndDate(date); 
  });
});

function recalculateEndDate(date) {
  var start_format = $("#tracking_start_time").data('format');
  var start_value = $("#tracking_start_time").val();
  var dur_value = $("#tracking_minutes").val();
  var end_format = $("#tracking_end_time").data('format-moment');

  start_date = moment(start_value, start_format);
  var end_date = start_date.add('minutes', dur_value);

  $("#tracking_end_time").val(end_date.format(end_format));
}
