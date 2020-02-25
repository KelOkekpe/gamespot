##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Serverless < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class EnvironmentContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class VariableList < ListResource
              ##
              # Initialize the VariableList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the Service that the Variable resource is
              #   associated with.
              # @param [String] environment_sid The SID of the environment in which the variable
              #   exists.
              # @return [VariableList] VariableList
              def initialize(version, service_sid: nil, environment_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, environment_sid: environment_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Environments/#{@solution[:environment_sid]}/Variables"
              end

              ##
              # Lists VariableInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(limit: nil, page_size: nil)
                self.stream(limit: limit, page_size: page_size).entries
              end

              ##
              # Streams VariableInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields VariableInstance records from the API.
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
              # Retrieve a single page of VariableInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of VariableInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                VariablePage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of VariableInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of VariableInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                VariablePage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of VariableInstance records from the API.
              # Request is executed immediately.
              # @param [String] key A string by which the Variable resource can be referenced.
              #   Must be less than 128 characters long.
              # @param [String] value A string that contains the actual value of the variable.
              #   Must have less than 450 bytes.
              # @return [VariableInstance] Newly created VariableInstance
              def create(key: nil, value: nil)
                data = Twilio::Values.of({'Key' => key, 'Value' => value, })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                VariableInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:environment_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Serverless.V1.VariableList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class VariablePage < Page
              ##
              # Initialize the VariablePage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [VariablePage] VariablePage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of VariableInstance
              # @param [Hash] payload Payload response from the API
              # @return [VariableInstance] VariableInstance
              def get_instance(payload)
                VariableInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:environment_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Serverless.V1.VariablePage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class VariableContext < InstanceContext
              ##
              # Initialize the VariableContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the Service to fetch the Variable
              #   resource from.
              # @param [String] environment_sid The SID of the environment with the Variable
              #   resource to fetch.
              # @param [String] sid The SID of the Variable resource to fetch.
              # @return [VariableContext] VariableContext
              def initialize(version, service_sid, environment_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, environment_sid: environment_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Environments/#{@solution[:environment_sid]}/Variables/#{@solution[:sid]}"
              end

              ##
              # Fetch a VariableInstance
              # @return [VariableInstance] Fetched VariableInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                VariableInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:environment_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Update the VariableInstance
              # @param [String] key A string by which the Variable resource can be referenced.
              #   Must be less than 128 characters long.
              # @param [String] value A string that contains the actual value of the variable.
              #   Must have less than 450 bytes.
              # @return [VariableInstance] Updated VariableInstance
              def update(key: :unset, value: :unset)
                data = Twilio::Values.of({'Key' => key, 'Value' => value, })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                VariableInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:environment_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the VariableInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.VariableContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.VariableContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class VariableInstance < InstanceResource
              ##
              # Initialize the VariableInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the Service that the Variable resource is
              #   associated with.
              # @param [String] environment_sid The SID of the environment in which the variable
              #   exists.
              # @param [String] sid The SID of the Variable resource to fetch.
              # @return [VariableInstance] VariableInstance
              def initialize(version, payload, service_sid: nil, environment_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'environment_sid' => payload['environment_sid'],
                    'key' => payload['key'],
                    'value' => payload['value'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'environment_sid' => environment_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [VariableContext] VariableContext for this VariableInstance
              def context
                unless @instance_context
                  @instance_context = VariableContext.new(
                      @version,
                      @params['service_sid'],
                      @params['environment_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The unique string that identifies the Variable resource
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The SID of the Account that created the Variable resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The SID of the Service that the Variable resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The SID of the environment in which the variable exists
              def environment_sid
                @properties['environment_sid']
              end

              ##
              # @return [String] A string by which the Variable resource can be referenced
              def key
                @properties['key']
              end

              ##
              # @return [String] A string that contains the actual value of the variable
              def value
                @properties['value']
              end

              ##
              # @return [Time] The ISO 8601 date and time in GMT when the Variable resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The ISO 8601 date and time in GMT when the Variable resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The absolute URL of the Variable resource
              def url
                @properties['url']
              end

              ##
              # Fetch a VariableInstance
              # @return [VariableInstance] Fetched VariableInstance
              def fetch
                context.fetch
              end

              ##
              # Update the VariableInstance
              # @param [String] key A string by which the Variable resource can be referenced.
              #   Must be less than 128 characters long.
              # @param [String] value A string that contains the actual value of the variable.
              #   Must have less than 450 bytes.
              # @return [VariableInstance] Updated VariableInstance
              def update(key: :unset, value: :unset)
                context.update(key: key, value: value, )
              end

              ##
              # Deletes the VariableInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.VariableInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.VariableInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end