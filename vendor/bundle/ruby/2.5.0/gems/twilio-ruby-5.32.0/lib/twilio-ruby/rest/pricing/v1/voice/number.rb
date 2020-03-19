##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Pricing < Domain
      class V1 < Version
        class VoiceList < ListResource
          class NumberList < ListResource
            ##
            # Initialize the NumberList
            # @param [Version] version Version that contains the resource
            # @return [NumberList] NumberList
            def initialize(version)
              super(version)

              # Path Solution
              @solution = {}
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Pricing.V1.NumberList>'
            end
          end

          class NumberPage < Page
            ##
            # Initialize the NumberPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [NumberPage] NumberPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of NumberInstance
            # @param [Hash] payload Payload response from the API
            # @return [NumberInstance] NumberInstance
            def get_instance(payload)
              NumberInstance.new(@version, payload, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Pricing.V1.NumberPage>'
            end
          end

          class NumberContext < InstanceContext
            ##
            # Initialize the NumberContext
            # @param [Version] version Version that contains the resource
            # @param [String] number The phone number to fetch.
            # @return [NumberContext] NumberContext
            def initialize(version, number)
              super(version)

              # Path Solution
              @solution = {number: number, }
              @uri = "/Voice/Numbers/#{CGI.escape(@solution[:number]).gsub("+", "%20")}"
            end

            ##
            # Fetch a NumberInstance
            # @return [NumberInstance] Fetched NumberInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              NumberInstance.new(@version, payload, number: @solution[:number], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Pricing.V1.NumberContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Pricing.V1.NumberContext #{context}>"
            end
          end

          class NumberInstance < InstanceResource
            ##
            # Initialize the NumberInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] number The phone number to fetch.
            # @return [NumberInstance] NumberInstance
            def initialize(version, payload, number: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'number' => payload['number'],
                  'country' => payload['country'],
                  'iso_country' => payload['iso_country'],
                  'outbound_call_price' => payload['outbound_call_price'],
                  'inbound_call_price' => payload['inbound_call_price'],
                  'price_unit' => payload['price_unit'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'number' => number || @properties['number'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [NumberContext] NumberContext for this NumberInstance
            def context
              unless @instance_context
                @instance_context = NumberContext.new(@version, @params['number'], )
              end
              @instance_context
            end

            ##
            # @return [String] The phone number
            def number
              @properties['number']
            end

            ##
            # @return [String] The name of the country
            def country
              @properties['country']
            end

            ##
            # @return [String] The ISO country code
            def iso_country
              @properties['iso_country']
            end

            ##
            # @return [String] The OutboundCallPrice record
            def outbound_call_price
              @properties['outbound_call_price']
            end

            ##
            # @return [String] The InboundCallPrice record
            def inbound_call_price
              @properties['inbound_call_price']
            end

            ##
            # @return [String] The currency in which prices are measured, in ISO 4127 format (e.g. usd, eur, jpy)
            def price_unit
              @properties['price_unit']
            end

            ##
            # @return [String] The absolute URL of the resource
            def url
              @properties['url']
            end

            ##
            # Fetch a NumberInstance
            # @return [NumberInstance] Fetched NumberInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Pricing.V1.NumberInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Pricing.V1.NumberInstance #{values}>"
            end
          end
        end
      end
    end
  end
end