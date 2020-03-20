class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :assign_env_variables

  protect_from_forgery with: :exception

    def redirect_if_not_signed_in
    redirect_to root_path if !user_signed_in?
  end

  def redirect_if_signed_in
    redirect_to root_path if user_signed_in?
  end

  def after_sign_in_path_for(resource)
    client = Signet::OAuth2::Client.new(client_options)
    client.authorization_uri.to_s
  end   #comment this out so it will work in prod

  def assign_env_variables
    gon.google_calendar_api_key = ENV["GOOGLE_CALENDAR_API_KEY"]
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ user_type: %w[host cleaner] },:name, :user_type, :email, :password, :password_confirmation)
    end
  end

  def client_options
    {
      client_id: ENV['GOOGLE_CLIENT_ID'], #hard cvode prod value so it will work in prod
      client_secret: ENV['GOOGLE_CLIENT_SECRET'], #hard code prod value so it will work in prod
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url
    }
  end

end
