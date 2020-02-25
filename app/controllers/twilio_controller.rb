class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token
    # def sms
    #   response = Twilio::TwiML::MessagingResponse.new do |r|
    #     r.message body: Booking.last.notes
    #   end
    #   render xml: response.to_s
    # end
end
