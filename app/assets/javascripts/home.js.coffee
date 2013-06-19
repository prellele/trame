$ ->
  $("#tracking_start_time").on "change", ->
    date = $(this).val();
    if moment(date, @data('format-moment'))
      recalculateEndDate(date)

  $("#datetimepicker").on "changeDate", ->
    date = $(this).find('input').val()
    if moment(date, $(this).data('format-moment'))
      recalculateEndDate(date)

  $("#datetimepicker").on "show", ->
    date = $(this).find('input').val()
    if moment(date, $(this).data('format-moment')) 
      recalculateEndDate(date)

  $("#tracking_minutes").on "change", ->
    date = $(this).val()
    recalculateEndDate(date)


recalculateEndDate = (date) ->
  start_format = $("#tracking_start_time").data("format")
  start_value = $("#tracking_start_time").val()
  dur_value = $("#tracking_minutes").val()
  end_format = $("#tracking_end_time").data("format-moment")
  
  start_date = moment(start_value, start_format)
  end_date = start_date.add("minutes", dur_value)
  
  $("#tracking_end_time").val end_date.format(end_format)

