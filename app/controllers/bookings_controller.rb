class BookingsController < ApplicationController

  def index
    @user = current_user
    @total_bookings = Booking.where(cleaner_id:@user.id)
  end

  def show
    @user = current_user
    @booking = Booking.last
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
      redirect_to root_path
    end
  end

  private

  def booking_params
    params["/booking_form"].permit(:notes, :cleaner_id, :host_id)
  end


end
