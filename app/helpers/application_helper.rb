module ApplicationHelper
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

  def global_default_daterange
    global_default_daterange = "#{Date.today.beginning_of_month.strftime("%d-%m-%Y")} - #{Date.today.strftime("%d-%m-%Y")}"
  end

  def priority_as_text(priority)
    case priority
    when 'l'
      t('priority.low')
    when 'm'
      t('priority.middle')
    when 'h'
      t('priority.high')
    end
  end

  def yes_no_as_text(bool)
    case bool
    when true
      t('yes')
    when false
      t('no')
    end
  end

end
