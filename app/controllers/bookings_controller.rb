require "google/apis/calendar_v3"
class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.user_type =='host'
      @bookings = Booking.where(host_id:current_user.id)
    else current_user.user_type =='cleaner'
      @bookings = Booking.where(cleaner_id:current_user.id)
    end
  end

  def booking_table
    @user = current_user
    if @user.user_type == 'host'
      @bookings = Booking.where(host_id:@user.id, status: "#{params[:status]}")
      .paginate(:page => params[:page], :per_page => 5)
    else @user.user_type == 'cleaner'
      @bookings = Booking.where(cleaner_id:@user.id, status: "#{params[:status]}")
      .paginate(:page => params[:page], :per_page => 5)
    end
  end

  def show
  end

  def new
    @cleaner    = User.find(params[:cleaner_id])
    @host       = User.find(params[:host_id])
    @booking    = Booking.new
    @units      = @host.units.map{|unit| unit}
    @price      = @booking.price
    @starts_at  = params[:starts_at]
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.update(status:'approved')
    if @booking.save
      flash[:success] = "Reservation Approved"
      # send_approved_booking_notification(@booking)
      new_event(@booking.starts_at.to_date,@booking.starts_at.to_date,
      @booking.cleaner, @booking.host, @booking.unit, @booking.event_id)
      redirect_to dashboard_path
    else
      flash[:error] = "Reservation could not be accepted"
      redirect_to root_path
    end
  end

  def deny
    @booking = Booking.find(params[:id])
    @booking.update(status:'denied')
    if @booking.save
      flash[:success] = "Reservation Denied"
      redirect_to dashboard_path
    else
      flash[:error] = "Reservation could not be denied"
      redirect_to root_path
    end
  end

  def cancel
    @booking = Booking.find(params[:id])
    @booking.update(status:'cancelled')
    if @booking.save
      flash[:success] = "Reservation Cancelled"
      call_delete_event(@booking.event_id)
      redirect_to dashboard_path
    else
      flash[:error] = "Reservation could not be cancelled"
      redirect_to root_path
    end
  end


  def create
    @user = current_user
    @booking = Booking.new(
      notes: booking_params[:notes],
      host_id: booking_params[:host_id],
      cleaner_id: booking_params[:cleaner_id],
      requested_by_id: booking_params[:requested_by_id],
      starts_at: booking_params[:starts_at],
      price: booking_params[:price],
      unit_id: booking_params[:unit_id]
    )
    if @booking.save
      flash[:success] = "Booking Created"
      # send_requested_booking_notification(@booking)
      redirect_to request_message_path
    else
      flash[:error] = "Booking Failed to Create"
      redirect_to root_path
    end
  end

  def new_event(start, endd, cleaner, host, unit, event_id)
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    calendar = service.get_calendar(:primary)
    today = Date.today
    event = Google::Apis::CalendarV3::Event.new({
      start: Google::Apis::CalendarV3::EventDateTime.new(date: start),
      end: Google::Apis::CalendarV3::EventDateTime.new(date: endd),
      attendees: [{email: host.email},{email: cleaner.email}],
      summary: "#{cleaner.name} at #{unit.name} - #{event_id}",
      id: event_id
    })
    service.insert_event(calendar.id, event)
  end

  def destroy
    call_delete_event(@booking.event_id)

    @booking.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def call_delete_event(event)
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    service.delete_event(:primary, event)
  end

  def request_message
  end

  def send_approved_booking_notification(booking)
    client = Twilio::REST::Client.new
    user = booking.requested_by

    client.messages.create(
      from: '+14043838904',
      to: '+14045995789',
      body: "Hey #{user.name}, your cleaning on #{booking.starts_at.strftime("%B %d/%Y")}\
      for #{booking.unit.name} has been approved! You will earn $#{booking.price}"
    )
  end

  def send_requested_booking_notification(booking)
    client = Twilio::REST::Client.new
    if current_user.user_type == 'host'
      user = booking.cleaner
    elsif current_user.user_type == 'cleaner'
      user = booking.host
    end

    if user.user_type == 'host'
    client.messages.create(
      from: '+14043838904',
      to: '+14045995789',
      body: "Hey #{user.name}, #{booking.requested_by.name} has requested to\
       clean #{booking.unit.name}on #{booking.starts_at.strftime("%B %d %Y")}\
       for $#{booking.price}!"
    )
    elsif user.user_type =='cleaner'
      client.messages.create(
        from: '+14043838904',
        to: '+14045995789',
        body: "Hey #{user.name}, #{booking.requested_by.name} has requested a\
        cleanining for #{booking.unit.name} on #{booking.starts_at.strftime("%B %d %Y")}\
        for $#{booking.price}!"
      )
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:notes, :cleaner_id, :host_id, :requested_by_id,
       :starts_at, :price, :unit_id, :utf8, :authenticity_token, :commit)
  end



end
