##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class Understand < Version
        class AssistantContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class StyleSheetList < ListResource
            ##
            # Initialize the StyleSheetList
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The unique ID of the Assistant
            # @return [StyleSheetList] StyleSheetList
            def initialize(version, assistant_sid: nil)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid}
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Understand.StyleSheetList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class StyleSheetPage < Page
            ##
            # Initialize the StyleSheetPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [StyleSheetPage] StyleSheetPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of StyleSheetInstance
            # @param [Hash] payload Payload response from the API
            # @return [StyleSheetInstance] StyleSheetInstance
            def get_instance(payload)
              StyleSheetInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Understand.StyleSheetPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class StyleSheetContext < InstanceContext
            ##
            # Initialize the StyleSheetContext
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The unique ID of the Assistant
            # @return [StyleSheetContext] StyleSheetContext
            def initialize(version, assistant_sid)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid, }
              @uri = "/Assistants/#{@solution[:assistant_sid]}/StyleSheet"
            end

            ##
            # Fetch a StyleSheetInstance
            # @return [StyleSheetInstance] Fetched StyleSheetInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              StyleSheetInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Update the StyleSheetInstance
            # @param [Hash] style_sheet The JSON Style sheet string
            # @return [StyleSheetInstance] Updated StyleSheetInstance
            def update(style_sheet: :unset)
              data = Twilio::Values.of({'StyleSheet' => Twilio.serialize_object(style_sheet), })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              StyleSheetInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Understand.StyleSheetContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Understand.StyleSheetContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class StyleSheetInstance < InstanceResource
            ##
            # Initialize the StyleSheetInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] assistant_sid The unique ID of the Assistant
            # @return [StyleSheetInstance] StyleSheetInstance
            def initialize(version, payload, assistant_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'assistant_sid' => payload['assistant_sid'],
                  'url' => payload['url'],
                  'data' => payload['data'],
              }

              # Context
              @instance_context = nil
              @params = {'assistant_sid' => assistant_sid, }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [StyleSheetContext] StyleSheetContext for this StyleSheetInstance
            def context
              unless @instance_context
                @instance_context = StyleSheetContext.new(@version, @params['assistant_sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique ID of the Account that created this Assistant
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The unique ID of the Assistant
            def assistant_sid
              @properties['assistant_sid']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [Hash] The JSON style sheet object
            def data
              @properties['data']
            end

            ##
            # Fetch a StyleSheetInstance
            # @return [StyleSheetInstance] Fetched StyleSheetInstance
            def fetch
              context.fetch
            end

            ##
            # Update the StyleSheetInstance
            # @param [Hash] style_sheet The JSON Style sheet string
            # @return [StyleSheetInstance] Updated StyleSheetInstance
            def update(style_sheet: :unset)
              context.update(style_sheet: style_sheet, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.StyleSheetInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.StyleSheetInstance #{values}>"
            end
          end
        end
      end
    end
  end
end