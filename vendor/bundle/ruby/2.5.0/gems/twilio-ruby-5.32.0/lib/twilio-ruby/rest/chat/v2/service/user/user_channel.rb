##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Chat < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class UserContext < InstanceContext
            class UserChannelList < ListResource
              ##
              # Initialize the UserChannelList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the
              #   [Service](https://www.twilio.com/docs/chat/rest/service-resource) the User
              #   Channel resource is associated with.
              # @param [String] user_sid The SID of the
              #   [User](https://www.twilio.com/docs/chat/rest/user-resource) the User Channel
              #   belongs to.
              # @return [UserChannelList] UserChannelList
              def initialize(version, service_sid: nil, user_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, user_sid: user_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:user_sid]}/Channels"
              end

              ##
              # Lists UserChannelInstance records from the API as a list.
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
              # Streams UserChannelInstance records from the API as an Enumerable.
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
              # When passed a block, yields UserChannelInstance records from the API.
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
              # Retrieve a single page of UserChannelInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of UserChannelInstance
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
                UserChannelPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of UserChannelInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of UserChannelInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                UserChannelPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Chat.V2.UserChannelList>'
              end
            end

            class UserChannelPage < Page
              ##
              # Initialize the UserChannelPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [UserChannelPage] UserChannelPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of UserChannelInstance
              # @param [Hash] payload Payload response from the API
              # @return [UserChannelInstance] UserChannelInstance
              def get_instance(payload)
                UserChannelInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    user_sid: @solution[:user_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Chat.V2.UserChannelPage>'
              end
            end

            class UserChannelContext < InstanceContext
              ##
              # Initialize the UserChannelContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the
              #   [Service](https://www.twilio.com/docs/chat/rest/service-resource) to fetch the
              #   User Channel resource from.
              # @param [String] user_sid The SID of the
              #   [User](https://www.twilio.com/docs/chat/rest/user-resource) to fetch the User
              #   Channel resource from. This value can be either the `sid` or the `identity` of
              #   the User resource.
              # @param [String] channel_sid The SID of the
              #   [Channel](https://www.twilio.com/docs/chat/channels) that has the User Channel
              #   to fetch. This value can be either the `sid` or the `unique_name` of the Channel
              #   to fetch.
              # @return [UserChannelContext] UserChannelContext
              def initialize(version, service_sid, user_sid, channel_sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, user_sid: user_sid, channel_sid: channel_sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:user_sid]}/Channels/#{@solution[:channel_sid]}"
              end

              ##
              # Fetch a UserChannelInstance
              # @return [UserChannelInstance] Fetched UserChannelInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                UserChannelInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    user_sid: @solution[:user_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Deletes the UserChannelInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Update the UserChannelInstance
              # @param [user_channel.NotificationLevel] notification_level The push notification
              #   level to assign to the User Channel. Can be: `default` or `muted`.
              # @param [String] last_consumed_message_index The index of the last
              #   [Message](https://www.twilio.com/docs/chat/rest/message-resource) in the
              #   [Channel](https://www.twilio.com/docs/chat/channels) that the Member has read.
              # @param [Time] last_consumption_timestamp The [ISO
              #   8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp of the last
              #   [Message](https://www.twilio.com/docs/chat/rest/message-resource) read event for
              #   the Member within the [Channel](https://www.twilio.com/docs/chat/channels).
              # @return [UserChannelInstance] Updated UserChannelInstance
              def update(notification_level: :unset, last_consumed_message_index: :unset, last_consumption_timestamp: :unset)
                data = Twilio::Values.of({
                    'NotificationLevel' => notification_level,
                    'LastConsumedMessageIndex' => last_consumed_message_index,
                    'LastConsumptionTimestamp' => Twilio.serialize_iso8601_datetime(last_consumption_timestamp),
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                UserChannelInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    user_sid: @solution[:user_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Chat.V2.UserChannelContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Chat.V2.UserChannelContext #{context}>"
              end
            end

            class UserChannelInstance < InstanceResource
              ##
              # Initialize the UserChannelInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the
              #   [Service](https://www.twilio.com/docs/chat/rest/service-resource) the User
              #   Channel resource is associated with.
              # @param [String] user_sid The SID of the
              #   [User](https://www.twilio.com/docs/chat/rest/user-resource) the User Channel
              #   belongs to.
              # @param [String] channel_sid The SID of the
              #   [Channel](https://www.twilio.com/docs/chat/channels) that has the User Channel
              #   to fetch. This value can be either the `sid` or the `unique_name` of the Channel
              #   to fetch.
              # @return [UserChannelInstance] UserChannelInstance
              def initialize(version, payload, service_sid: nil, user_sid: nil, channel_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'channel_sid' => payload['channel_sid'],
                    'user_sid' => payload['user_sid'],
                    'member_sid' => payload['member_sid'],
                    'status' => payload['status'],
                    'last_consumed_message_index' => payload['last_consumed_message_index'] == nil ? payload['last_consumed_message_index'] : payload['last_consumed_message_index'].to_i,
                    'unread_messages_count' => payload['unread_messages_count'] == nil ? payload['unread_messages_count'] : payload['unread_messages_count'].to_i,
                    'links' => payload['links'],
                    'url' => payload['url'],
                    'notification_level' => payload['notification_level'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'user_sid' => user_sid,
                    'channel_sid' => channel_sid || @properties['channel_sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [UserChannelContext] UserChannelContext for this UserChannelInstance
              def context
                unless @instance_context
                  @instance_context = UserChannelContext.new(
                      @version,
                      @params['service_sid'],
                      @params['user_sid'],
                      @params['channel_sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The SID of the Service that the resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The SID of the Channel the resource belongs to
              def channel_sid
                @properties['channel_sid']
              end

              ##
              # @return [String] The SID of the User the User Channel belongs to
              def user_sid
                @properties['user_sid']
              end

              ##
              # @return [String] The SID of the User as a Member in the Channel
              def member_sid
                @properties['member_sid']
              end

              ##
              # @return [user_channel.ChannelStatus] The status of the User on the Channel
              def status
                @properties['status']
              end

              ##
              # @return [String] The index of the last Message in the Channel the Member has read
              def last_consumed_message_index
                @properties['last_consumed_message_index']
              end

              ##
              # @return [String] The number of unread Messages in the Channel for the User
              def unread_messages_count
                @properties['unread_messages_count']
              end

              ##
              # @return [String] Absolute URLs to access the Members, Messages , Invites and, if it exists, the last Message for the Channel
              def links
                @properties['links']
              end

              ##
              # @return [String] The absolute URL of the resource
              def url
                @properties['url']
              end

              ##
              # @return [user_channel.NotificationLevel] The push notification level of the User for the Channel
              def notification_level
                @properties['notification_level']
              end

              ##
              # Fetch a UserChannelInstance
              # @return [UserChannelInstance] Fetched UserChannelInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the UserChannelInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Update the UserChannelInstance
              # @param [user_channel.NotificationLevel] notification_level The push notification
              #   level to assign to the User Channel. Can be: `default` or `muted`.
              # @param [String] last_consumed_message_index The index of the last
              #   [Message](https://www.twilio.com/docs/chat/rest/message-resource) in the
              #   [Channel](https://www.twilio.com/docs/chat/channels) that the Member has read.
              # @param [Time] last_consumption_timestamp The [ISO
              #   8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp of the last
              #   [Message](https://www.twilio.com/docs/chat/rest/message-resource) read event for
              #   the Member within the [Channel](https://www.twilio.com/docs/chat/channels).
              # @return [UserChannelInstance] Updated UserChannelInstance
              def update(notification_level: :unset, last_consumed_message_index: :unset, last_consumption_timestamp: :unset)
                context.update(
                    notification_level: notification_level,
                    last_consumed_message_index: last_consumed_message_index,
                    last_consumption_timestamp: last_consumption_timestamp,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Chat.V2.UserChannelInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Chat.V2.UserChannelInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end