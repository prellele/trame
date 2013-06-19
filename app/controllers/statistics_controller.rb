class StatisticsController < ApplicationController

  # GET /
  def index
    @daterange_left ||= params[:daterange_left].present? ? params[:daterange_left] : this_week_string()
    @daterange_right ||= params[:daterange_right].present? ? params[:daterange_right] : last_week_string()
    params[:daterange_left] = @daterange_left
    params[:daterange_right] = @daterange_right
  end

end