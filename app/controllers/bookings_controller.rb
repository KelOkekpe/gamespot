class BookingsController < ApplicationController

  def index
    @user = current_user
    @total_bookings = Booking.where(cleaner_id:@user.id)
    @pending_bookings = Booking.where(cleaner_id:@user.id, status:'pending')
    @approved_bookings = Booking.where(cleaner_id:@user.id, status:'approved')
  end

  def show
    @cleaner    = User.find(params[:cleaner_id])
    @host       = current_user
    @booking    = Booking.new
  end

  def new
    @cleaner    = User.find(params[:cleaner_id])
    @host       = current_user
    @booking    = Booking.new
  end


  def approve
    @booking = Booking.find(params[:id])
    @booking.update(status:'approved')
      if @booking.save
        flash[:success] = "Reservation Approved"
        redirect_to dashboard_path
      else
        flash[:alert] = "Reservation could not be accepted"
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
        flash[:alert] = "Reservation could not be denied"
        redirect_to root_path
      end
  end


  def request_message
  end

  def create
    @user = current_user
    @booking = Booking.new(notes: booking_params[:notes],
      host_id: booking_params[:host_id],
      cleaner_id: booking_params[:cleaner_id])
    if @booking.save
      flash[:success] = "Booking Created"
      redirect_to request_message_path
    else
      flash[:alert] = "Booking Failed to Create"
      redirect_to root_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:notes, :cleaner_id, :host_id, :utf8, :authenticity_token, :commit)
  end




end
