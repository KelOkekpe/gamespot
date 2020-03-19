##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Command' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.supersim.v1.commands.create(sim: 'HSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', command: 'command')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Sim' => 'HSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'Command' => 'command', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://supersim.twilio.com/v1/Commands',
        data: values,
    ))).to eq(true)
  end

  it "receives create_command_minimal responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "command": "command",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "sim_sid": "HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "HCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "queued",
          "direction": "to_sim",
          "url": "https://supersim.twilio.com/v1/Commands/HCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.supersim.v1.commands.create(sim: 'HSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', command: 'command')

    expect(actual).to_not eq(nil)
  end

  it "receives create_command_full responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "command": "command",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "sim_sid": "HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "HCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "queued",
          "direction": "to_sim",
          "url": "https://supersim.twilio.com/v1/Commands/HCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.supersim.v1.commands.create(sim: 'HSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', command: 'command')

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.supersim.v1.commands('HCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://supersim.twilio.com/v1/Commands/HCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "HCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "command": "content of the command",
          "sim_sid": "HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "queued",
          "direction": "to_sim",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "url": "https://supersim.twilio.com/v1/Commands/HCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.supersim.v1.commands('HCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.supersim.v1.commands.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://supersim.twilio.com/v1/Commands',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "commands": [],
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/Commands?Status=queued&Sim=HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&PageSize=50&Page=0",
              "key": "commands",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/Commands?Status=queued&Sim=HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.supersim.v1.commands.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://supersim.twilio.com/v1/Commands?Status=queued&Sim=HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&PageSize=50&Page=0",
              "key": "commands",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://supersim.twilio.com/v1/Commands?Status=queued&Sim=HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&PageSize=50&Page=0"
          },
          "commands": [
              {
                  "sid": "HCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "command": "content of the command",
                  "sim_sid": "HSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "status": "queued",
                  "direction": "from_sim",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "url": "https://supersim.twilio.com/v1/Commands/HCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.supersim.v1.commands.list()

    expect(actual).to_not eq(nil)
  end
end