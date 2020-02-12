class BookingsController < ApplicationController
  #The index controller shows a list of different Bookings
  def index
    @user = current_user
    if @user.user_type == 'host'
      @bookings = Booking.where(host_id:@user.id, status: "#{params[:status]}")
    else @user.user_type == 'cleaner'
      @bookings = Booking.where(cleaner_id:@user.id, status: "#{params[:status]}")
    end
  end
  # def show
  #   @cleaner    = User.find(params[:cleaner_id])
  #   @host       = User.find(params[:host_id])
  #   @booking    = Booking.new
  # end
  def new
    @cleaner    = User.find(params[:cleaner_id])
    @host       = User.find(params[:host_id])
    @booking    = Booking.new
    @units      = @host.units.map{|unit| unit}
    @price      = @booking.price
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.update(status:'approved')
      if @booking.save
        flash[:success] = "Reservation Approved"
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
        redirect_to dashboard_path
      else
        flash[:error] = "Reservation could not be cancelled"
        redirect_to root_path
      end
  end

  def create
    @user = current_user
    @booking = Booking.new(notes: booking_params[:notes],
      host_id: booking_params[:host_id],
      cleaner_id: booking_params[:cleaner_id],
      requested_by_id: booking_params[:requested_by_id],
      starts_at: booking_params[:starts_at],
      unit_id: booking_params[:unit_id])
    if @booking.save
      flash[:success] = "Booking Created"
      redirect_to request_message_path
    else
      flash[:error] = "Booking Failed to Create"
      redirect_to root_path
    end
  end

  def request_message
  end

  private

  def booking_params
    params.require(:booking).permit(:notes, :cleaner_id, :host_id, :requested_by_id, :starts_at, :unit_id, :utf8, :authenticity_token, :commit)
  end

end
