module ApplicationHelper
  def twitterized_type(type)
    case type
      when :alert then
        "alert-block"
      when :error then
        "alert-error"
      when :notice then
        "alert-info"
      when :success then
        "alert-success"
      else
        type.to_s
    end
  end

  def flash_class(level)
    case level
      when :notice then
        "alert alert-info"
      when :success then
        "alert alert-success"
      when :error then
        "alert alert-error"
      when :alert then
        "alert alert-error"
    end
  end

  def duration_in_words(minutes)
    min = minutes % 60
    hrs = minutes / 60

    duration_hrs = "#{t('time.formats.time_hrs', hours: hrs)}" if hrs > 0
    duration_min = "#{t('time.formats.time_min', minutes: min)}" if min > 0

    if duration_hrs && duration_min
      "#{duration_hrs} #{duration_min}"
    elsif duration_hrs
      duration_hrs
    elsif duration_min
      duration_min
    else
      "#{t('time.formats.time_hrs', hours: hrs)} #{t('time.formats.time_min', minutes: min)}"
    end
  end

  def current_url(new_params)
    url_for :params => params.merge(new_params)
  end
  
end
