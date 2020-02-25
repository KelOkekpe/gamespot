##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class ActivityList < ListResource
            ##
            # Initialize the ActivityList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The SID of the Workspace that contains the
            #   Activity.
            # @return [ActivityList] ActivityList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid}
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Activities"
            end

            ##
            # Lists ActivityInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] friendly_name The `friendly_name` of the Activity resources to
            #   read.
            # @param [String] available Whether return only Activity resources that are
            #   available or unavailable. A value of `true` returns only available activities.
            #   Values of '1' or `yes` also indicate `true`. All other values represent `false`
            #   and return activities that are unavailable.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(friendly_name: :unset, available: :unset, limit: nil, page_size: nil)
              self.stream(
                  friendly_name: friendly_name,
                  available: available,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams ActivityInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] friendly_name The `friendly_name` of the Activity resources to
            #   read.
            # @param [String] available Whether return only Activity resources that are
            #   available or unavailable. A value of `true` returns only available activities.
            #   Values of '1' or `yes` also indicate `true`. All other values represent `false`
            #   and return activities that are unavailable.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(friendly_name: :unset, available: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(friendly_name: friendly_name, available: available, page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ActivityInstance records from the API.
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
            # Retrieve a single page of ActivityInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name The `friendly_name` of the Activity resources to
            #   read.
            # @param [String] available Whether return only Activity resources that are
            #   available or unavailable. A value of `true` returns only available activities.
            #   Values of '1' or `yes` also indicate `true`. All other values represent `false`
            #   and return activities that are unavailable.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ActivityInstance
            def page(friendly_name: :unset, available: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'Available' => available,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              ActivityPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ActivityInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ActivityInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ActivityPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ActivityInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the Activity resource. It can be up to 64 characters long. These names are used
            #   to calculate and expose statistics about Workers, and provide visibility into
            #   the state of each Worker. Examples of friendly names include: `on-call`,
            #   `break`, and `email`.
            # @param [Boolean] available Whether the Worker should be eligible to receive a
            #   Task when it occupies the Activity. A value of `true`, `1`, or `yes` specifies
            #   the Activity is available. All other values specify that it is not.
            # @return [ActivityInstance] Newly created ActivityInstance
            def create(friendly_name: nil, available: :unset)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, 'Available' => available, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              ActivityInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.ActivityList>'
            end
          end

          class ActivityPage < Page
            ##
            # Initialize the ActivityPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ActivityPage] ActivityPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ActivityInstance
            # @param [Hash] payload Payload response from the API
            # @return [ActivityInstance] ActivityInstance
            def get_instance(payload)
              ActivityInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.ActivityPage>'
            end
          end

          class ActivityContext < InstanceContext
            ##
            # Initialize the ActivityContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The SID of the Workspace with the Activity
            #   resources to fetch.
            # @param [String] sid The SID of the Activity resource to fetch.
            # @return [ActivityContext] ActivityContext
            def initialize(version, workspace_sid, sid)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid, sid: sid, }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Activities/#{@solution[:sid]}"
            end

            ##
            # Fetch a ActivityInstance
            # @return [ActivityInstance] Fetched ActivityInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              ActivityInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the ActivityInstance
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the Activity resource. It can be up to 64 characters long. These names are used
            #   to calculate and expose statistics about Workers, and provide visibility into
            #   the state of each Worker. Examples of friendly names include: `on-call`,
            #   `break`, and `email`.
            # @return [ActivityInstance] Updated ActivityInstance
            def update(friendly_name: :unset)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              ActivityInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the ActivityInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.ActivityContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.ActivityContext #{context}>"
            end
          end

          class ActivityInstance < InstanceResource
            ##
            # Initialize the ActivityInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The SID of the Workspace that contains the
            #   Activity.
            # @param [String] sid The SID of the Activity resource to fetch.
            # @return [ActivityInstance] ActivityInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'available' => payload['available'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'sid' => payload['sid'],
                  'workspace_sid' => payload['workspace_sid'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'workspace_sid' => workspace_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ActivityContext] ActivityContext for this ActivityInstance
            def context
              unless @instance_context
                @instance_context = ActivityContext.new(@version, @params['workspace_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Boolean] Whether the Worker should be eligible to receive a Task when it occupies the Activity
            def available
              @properties['available']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The string that you assigned to describe the Activity resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the Workspace that contains the Activity
            def workspace_sid
              @properties['workspace_sid']
            end

            ##
            # @return [String] The absolute URL of the Activity resource
            def url
              @properties['url']
            end

            ##
            # Fetch a ActivityInstance
            # @return [ActivityInstance] Fetched ActivityInstance
            def fetch
              context.fetch
            end

            ##
            # Update the ActivityInstance
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the Activity resource. It can be up to 64 characters long. These names are used
            #   to calculate and expose statistics about Workers, and provide visibility into
            #   the state of each Worker. Examples of friendly names include: `on-call`,
            #   `break`, and `email`.
            # @return [ActivityInstance] Updated ActivityInstance
            def update(friendly_name: :unset)
              context.update(friendly_name: friendly_name, )
            end

            ##
            # Deletes the ActivityInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.ActivityInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.ActivityInstance #{values}>"
            end
          end
        end
      end
    end
  end
end