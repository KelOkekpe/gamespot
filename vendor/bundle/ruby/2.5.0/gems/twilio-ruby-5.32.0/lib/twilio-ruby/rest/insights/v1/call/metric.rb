##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Insights < Domain
      class V1 < Version
        class CallContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class MetricList < ListResource
            ##
            # Initialize the MetricList
            # @param [Version] version Version that contains the resource
            # @param [String] call_sid The call_sid
            # @return [MetricList] MetricList
            def initialize(version, call_sid: nil)
              super(version)

              # Path Solution
              @solution = {call_sid: call_sid}
              @uri = "/Voice/#{@solution[:call_sid]}/Metrics"
            end

            ##
            # Lists MetricInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [metric.TwilioEdge] edge The edge
            # @param [metric.StreamDirection] direction The direction
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(edge: :unset, direction: :unset, limit: nil, page_size: nil)
              self.stream(edge: edge, direction: direction, limit: limit, page_size: page_size).entries
            end

            ##
            # Streams MetricInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [metric.TwilioEdge] edge The edge
            # @param [metric.StreamDirection] direction The direction
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(edge: :unset, direction: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(edge: edge, direction: direction, page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields MetricInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of MetricInstance records from the API.
            # Request is executed immediately.
            # @param [metric.TwilioEdge] edge The edge
            # @param [metric.StreamDirection] direction The direction
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of MetricInstance
            def page(edge: :unset, direction: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Edge' => edge,
                  'Direction' => direction,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              MetricPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of MetricInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of MetricInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              MetricPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Insights.V1.MetricList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class MetricPage < Page
            ##
            # Initialize the MetricPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [MetricPage] MetricPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of MetricInstance
            # @param [Hash] payload Payload response from the API
            # @return [MetricInstance] MetricInstance
            def get_instance(payload)
              MetricInstance.new(@version, payload, call_sid: @solution[:call_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Insights.V1.MetricPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class MetricInstance < InstanceResource
            ##
            # Initialize the MetricInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] call_sid The call_sid
            # @return [MetricInstance] MetricInstance
            def initialize(version, payload, call_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'timestamp' => payload['timestamp'],
                  'call_sid' => payload['call_sid'],
                  'account_sid' => payload['account_sid'],
                  'edge' => payload['edge'],
                  'direction' => payload['direction'],
                  'carrier_edge' => payload['carrier_edge'],
                  'sip_edge' => payload['sip_edge'],
                  'sdk_edge' => payload['sdk_edge'],
                  'client_edge' => payload['client_edge'],
              }
            end

            ##
            # @return [String] The timestamp
            def timestamp
              @properties['timestamp']
            end

            ##
            # @return [String] The call_sid
            def call_sid
              @properties['call_sid']
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [metric.TwilioEdge] The edge
            def edge
              @properties['edge']
            end

            ##
            # @return [metric.StreamDirection] The direction
            def direction
              @properties['direction']
            end

            ##
            # @return [Hash] The carrier_edge
            def carrier_edge
              @properties['carrier_edge']
            end

            ##
            # @return [Hash] The sip_edge
            def sip_edge
              @properties['sip_edge']
            end

            ##
            # @return [Hash] The sdk_edge
            def sdk_edge
              @properties['sdk_edge']
            end

            ##
            # @return [Hash] The client_edge
            def client_edge
              @properties['client_edge']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Insights.V1.MetricInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Insights.V1.MetricInstance>"
            end
          end
        end
      end
    end
  end
end