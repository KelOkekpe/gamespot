class PagesController < ApplicationController

  def index
  end

  def dashboard
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    # @calendar = service.get_calendar(:primary)
    @calendar_list = service.list_calendar_lists

    @list = @calendar_list.items.map do |c|
      c.id
    end

  rescue Google::Apis::AuthorizationError
    response = client.refresh!
    session[:authorization] = session[:authorization].merge(response)
    retry
  end



end
