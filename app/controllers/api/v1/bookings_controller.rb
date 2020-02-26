module Api::V1
  class BookingsController < ApplicationController


    # def create
    #   @booking = Booking.new(notes: booking_params[:notes],
    #     host_id: booking_params[:host_id],
    #     cleaner_id: booking_params[:cleaner_id],
    #     requested_by_id: booking_params[:requested_by_id],
    #     starts_at: booking_params[:starts_at],
    #     price: booking_params[:price],
    #     unit_id: booking_params[:unit_id])
    # end
    #
    # def create_params
    #   {
    #     notes: params.require(:notes)
    #     cleaner_id: params.require(:cleaner_id)
    #     requested_by_id: params.require(:requested_by_id)
    #     starts_at: params.require(:starts_at)
    #     price: params.require(:price)
    #     unit_id: params.require(:unit_id)
    #   }
    # end
    #
    #
    # private
    #
    # def booking_params
    #     params.permit(params.require(:booking).permit(:notes, :cleaner_id,
    #       :host_id, :requested_by_id, :starts_at, :price, :unit_id, :utf8,
    #       :authenticity_token, :commit))
    # end



  end
end
