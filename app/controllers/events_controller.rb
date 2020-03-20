class EventsController < ApplicationController

  def redirect
    client = Signet::OAuth2::Client.new(client_options)
    redirect_to 'https://accounts.google.com/o/oauth2/auth'
  end

  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]
    response = client.fetch_access_token!
    session[:authorization] = response
    redirect_to dashboard_path
  end

  def calendar
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    # @calendar = service.get_calendar(:primary)
    @calendar_list = service.list_calendar_lists.items

    # @list = @calendar_list.items.map do |c|
    #   c.id
    # end
  rescue Google::Apis::AuthorizationError
    response = client.refresh!
    session[:authorization] = session[:authorization].merge(response)
    retry
  end

  def events
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    @event_list = service.list_events(params[:calendar_id])
  end



end
