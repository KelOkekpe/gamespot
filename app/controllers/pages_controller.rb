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
    @list_items = @calendar_list.items.map do |c|
      c
    end
    @summarys = @list_items.map do |i|
      i.summary = i.summary_override
    end

    color_styles = ['#FF7171', '#ade8ad','#bd95ff', '#8ac9e4','#fffb92',
                    '#752323', '538a31', '#135c6d', '#ffa2c4','f6edff' ]
    @legend_array = []
    i = 0
    #This populates the calendar legend with the proper units and corresponding colors
    @summarys.each do |sum|
      @legend_array << {title: sum, color:color_styles[i]}
      i += 1
    end

  rescue Google::Apis::AuthorizationError
    response = client.refresh!
    session[:authorization] = session[:authorization].merge(response)
    retry
  end

  def how_to
  end

end
