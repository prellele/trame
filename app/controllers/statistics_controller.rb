class StatisticsController < ApplicationController

  # GET /
  def index
    @daterange_left ||= params[:daterange_left].present? ? params[:daterange_left] : this_week_string()
    @daterange_right ||= params[:daterange_right].present? ? params[:daterange_right] : last_week_string()
    params[:daterange_left] = @daterange_left
    params[:daterange_right] = @daterange_right
  end

  private

  def data_by_range(range)
  	@trackings = current_user.trackings.by_daterange(range)
  	@attendances = current_user.attendances.by_daterange(range)
  end

  def this_week_string
    "#{l(Date.today.beginning_of_week, :format => t('date.formats.date_format')) } - #{l(Date.today, :format => t('date.formats.date_format')) }"
  end

  def last_week_string
    "#{l((Date.today-7.days).beginning_of_week, :format => t('date.formats.date_format')) } - #{l((Date.today-7.days).beginning_of_week+6.days, :format => t('date.formats.date_format')) }"
  end

end