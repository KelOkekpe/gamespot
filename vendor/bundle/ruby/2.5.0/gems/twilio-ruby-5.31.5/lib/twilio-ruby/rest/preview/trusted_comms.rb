##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Preview
      class TrustedComms < Version
        ##
        # Initialize the TrustedComms version of Preview
        def initialize(domain)
          super
          @version = 'TrustedComms'
          @branded_calls = nil
          @businesses = nil
          @cps = nil
          @current_calls = nil
          @devices = nil
          @phone_calls = nil
        end

        ##
        # @return [Twilio::REST::Preview::TrustedComms::BrandedCallContext]
        def branded_calls
          @branded_calls ||= BrandedCallList.new self
        end

        ##
        # @param [String] sid A 34 character string that uniquely identifies this
        #   Business.
        # @return [Twilio::REST::Preview::TrustedComms::BusinessContext] if sid was passed.
        # @return [Twilio::REST::Preview::TrustedComms::BusinessList]
        def businesses(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @businesses ||= BusinessList.new self
          else
            BusinessContext.new(self, sid)
          end
        end

        ##
        # @return [Twilio::REST::Preview::TrustedComms::CpsContext]
        def cps
          @cps ||= CpsContext.new self
        end

        ##
        # @return [Twilio::REST::Preview::TrustedComms::CurrentCallContext]
        def current_calls
          @current_calls ||= CurrentCallContext.new self
        end

        ##
        # @return [Twilio::REST::Preview::TrustedComms::DeviceContext]
        def devices
          @devices ||= DeviceList.new self
        end

        ##
        # @return [Twilio::REST::Preview::TrustedComms::PhoneCallContext]
        def phone_calls
          @phone_calls ||= PhoneCallList.new self
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Preview::TrustedComms>'
        end
      end
    end
  end
end