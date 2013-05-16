class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  before_filter :authenticate_user!
  before_filter :authorize

  delegate :allow?, :to => :current_permission
  helper_method :allow?

  delegate :allow_param?, :to => :current_permission
  helper_method :allow_param?

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header || 'en'
  end

  private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def current_resource
    nil
  end

  def authorize
    if current_permission.allow?(params[:controller], params[:action], current_resource)
      current_permission.permit_params! params
    else
      redirect_to root_url, alert: t("flash.alert.not_authorized")
    end
  end

end