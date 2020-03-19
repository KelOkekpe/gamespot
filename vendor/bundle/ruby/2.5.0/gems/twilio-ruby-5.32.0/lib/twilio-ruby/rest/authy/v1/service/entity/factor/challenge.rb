##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Authy < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class EntityContext < InstanceContext
            class FactorContext < InstanceContext
              ##
              # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
              class ChallengeList < ListResource
                ##
                # Initialize the ChallengeList
                # @param [Version] version Version that contains the resource
                # @param [String] service_sid The unique SID identifier of the Service.
                # @param [String] identity Customer unique identity for the Entity owner of the
                #   Challenge
                # @param [String] factor_sid The unique SID identifier of the Factor.
                # @return [ChallengeList] ChallengeList
                def initialize(version, service_sid: nil, identity: nil, factor_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {service_sid: service_sid, identity: identity, factor_sid: factor_sid}
                  @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Factors/#{@solution[:factor_sid]}/Challenges"
                end

                ##
                # Retrieve a single page of ChallengeInstance records from the API.
                # Request is executed immediately.
                # @param [Time] expiration_date The future date in which this Challenge will
                #   expire, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                # @param [String] details Details provided to give context about the Challenge.
                #   Shown to the end user.
                # @param [String] hidden_details Details provided to give context about the
                #   Challenge. Not shown to the end user.
                # @return [ChallengeInstance] Newly created ChallengeInstance
                def create(expiration_date: :unset, details: :unset, hidden_details: :unset)
                  data = Twilio::Values.of({
                      'ExpirationDate' => Twilio.serialize_iso8601_datetime(expiration_date),
                      'Details' => details,
                      'HiddenDetails' => hidden_details,
                  })

                  payload = @version.create(
                      'POST',
                      @uri,
                      data: data
                  )

                  ChallengeInstance.new(
                      @version,
                      payload,
                      service_sid: @solution[:service_sid],
                      identity: @solution[:identity],
                      factor_sid: @solution[:factor_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Authy.V1.ChallengeList>'
                end
              end

              ##
              # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
              class ChallengePage < Page
                ##
                # Initialize the ChallengePage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [ChallengePage] ChallengePage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of ChallengeInstance
                # @param [Hash] payload Payload response from the API
                # @return [ChallengeInstance] ChallengeInstance
                def get_instance(payload)
                  ChallengeInstance.new(
                      @version,
                      payload,
                      service_sid: @solution[:service_sid],
                      identity: @solution[:identity],
                      factor_sid: @solution[:factor_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Authy.V1.ChallengePage>'
                end
              end

              ##
              # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
              class ChallengeContext < InstanceContext
                ##
                # Initialize the ChallengeContext
                # @param [Version] version Version that contains the resource
                # @param [String] service_sid The unique SID identifier of the Service.
                # @param [String] identity Customer unique identity for the Entity owner of the
                #   Challenge
                # @param [String] factor_sid The unique SID identifier of the Factor.
                # @param [String] sid A 34 character string that uniquely identifies this
                #   Challenge. It also allows the keyword `latest` to fetch the most recent active
                #   Challenge created for a Factor.
                # @return [ChallengeContext] ChallengeContext
                def initialize(version, service_sid, identity, factor_sid, sid)
                  super(version)

                  # Path Solution
                  @solution = {service_sid: service_sid, identity: identity, factor_sid: factor_sid, sid: sid, }
                  @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Factors/#{@solution[:factor_sid]}/Challenges/#{@solution[:sid]}"
                end

                ##
                # Deletes the ChallengeInstance
                # @return [Boolean] true if delete succeeds, false otherwise
                def delete
                  @version.delete('delete', @uri)
                end

                ##
                # Fetch a ChallengeInstance
                # @return [ChallengeInstance] Fetched ChallengeInstance
                def fetch
                  params = Twilio::Values.of({})

                  payload = @version.fetch(
                      'GET',
                      @uri,
                      params,
                  )

                  ChallengeInstance.new(
                      @version,
                      payload,
                      service_sid: @solution[:service_sid],
                      identity: @solution[:identity],
                      factor_sid: @solution[:factor_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Update the ChallengeInstance
                # @param [String] auth_payload The optional payload needed to verify the
                #   Challenge. E.g., a TOTP would use the numeric code.
                # @return [ChallengeInstance] Updated ChallengeInstance
                def update(auth_payload: :unset)
                  data = Twilio::Values.of({'AuthPayload' => auth_payload, })

                  payload = @version.update(
                      'POST',
                      @uri,
                      data: data,
                  )

                  ChallengeInstance.new(
                      @version,
                      payload,
                      service_sid: @solution[:service_sid],
                      identity: @solution[:identity],
                      factor_sid: @solution[:factor_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Authy.V1.ChallengeContext #{context}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Authy.V1.ChallengeContext #{context}>"
                end
              end

              ##
              # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
              class ChallengeInstance < InstanceResource
                ##
                # Initialize the ChallengeInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] service_sid The unique SID identifier of the Service.
                # @param [String] identity Customer unique identity for the Entity owner of the
                #   Challenge
                # @param [String] factor_sid The unique SID identifier of the Factor.
                # @param [String] sid A 34 character string that uniquely identifies this
                #   Challenge. It also allows the keyword `latest` to fetch the most recent active
                #   Challenge created for a Factor.
                # @return [ChallengeInstance] ChallengeInstance
                def initialize(version, payload, service_sid: nil, identity: nil, factor_sid: nil, sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'sid' => payload['sid'],
                      'account_sid' => payload['account_sid'],
                      'service_sid' => payload['service_sid'],
                      'entity_sid' => payload['entity_sid'],
                      'identity' => payload['identity'],
                      'factor_sid' => payload['factor_sid'],
                      'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                      'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                      'date_responded' => Twilio.deserialize_iso8601_datetime(payload['date_responded']),
                      'expiration_date' => Twilio.deserialize_iso8601_datetime(payload['expiration_date']),
                      'status' => payload['status'],
                      'responded_reason' => payload['responded_reason'],
                      'details' => payload['details'],
                      'hidden_details' => payload['hidden_details'],
                      'factor_type' => payload['factor_type'],
                      'url' => payload['url'],
                  }

                  # Context
                  @instance_context = nil
                  @params = {
                      'service_sid' => service_sid,
                      'identity' => identity,
                      'factor_sid' => factor_sid,
                      'sid' => sid || @properties['sid'],
                  }
                end

                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @return [ChallengeContext] ChallengeContext for this ChallengeInstance
                def context
                  unless @instance_context
                    @instance_context = ChallengeContext.new(
                        @version,
                        @params['service_sid'],
                        @params['identity'],
                        @params['factor_sid'],
                        @params['sid'],
                    )
                  end
                  @instance_context
                end

                ##
                # @return [String] A string that uniquely identifies this Challenge.
                def sid
                  @properties['sid']
                end

                ##
                # @return [String] Account Sid.
                def account_sid
                  @properties['account_sid']
                end

                ##
                # @return [String] Service Sid.
                def service_sid
                  @properties['service_sid']
                end

                ##
                # @return [String] Entity Sid.
                def entity_sid
                  @properties['entity_sid']
                end

                ##
                # @return [String] Unique identity of the Entity
                def identity
                  @properties['identity']
                end

                ##
                # @return [String] Factor Sid.
                def factor_sid
                  @properties['factor_sid']
                end

                ##
                # @return [Time] The date this Challenge was created
                def date_created
                  @properties['date_created']
                end

                ##
                # @return [Time] The date this Challenge was updated
                def date_updated
                  @properties['date_updated']
                end

                ##
                # @return [Time] The date this Challenge was responded
                def date_responded
                  @properties['date_responded']
                end

                ##
                # @return [Time] The date this Challenge is expired
                def expiration_date
                  @properties['expiration_date']
                end

                ##
                # @return [challenge.ChallengeStatuses] The Status of this Challenge
                def status
                  @properties['status']
                end

                ##
                # @return [challenge.ChallengeReasons] The Reason of this Challenge `status`
                def responded_reason
                  @properties['responded_reason']
                end

                ##
                # @return [String] Public details provided to contextualize the Challenge
                def details
                  @properties['details']
                end

                ##
                # @return [String] Hidden details provided to contextualize the Challenge
                def hidden_details
                  @properties['hidden_details']
                end

                ##
                # @return [challenge.FactorTypes] The Factor Type of this Challenge
                def factor_type
                  @properties['factor_type']
                end

                ##
                # @return [String] The URL of this resource.
                def url
                  @properties['url']
                end

                ##
                # Deletes the ChallengeInstance
                # @return [Boolean] true if delete succeeds, false otherwise
                def delete
                  context.delete
                end

                ##
                # Fetch a ChallengeInstance
                # @return [ChallengeInstance] Fetched ChallengeInstance
                def fetch
                  context.fetch
                end

                ##
                # Update the ChallengeInstance
                # @param [String] auth_payload The optional payload needed to verify the
                #   Challenge. E.g., a TOTP would use the numeric code.
                # @return [ChallengeInstance] Updated ChallengeInstance
                def update(auth_payload: :unset)
                  context.update(auth_payload: auth_payload, )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Authy.V1.ChallengeInstance #{values}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Authy.V1.ChallengeInstance #{values}>"
                end
              end
            end
          end
        end
      end
    end
  end
end