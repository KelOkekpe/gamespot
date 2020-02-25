##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Sim' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.wireless.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/wireless/Sims/DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "commands_callback_method": "http_method",
          "commands_callback_url": "http://www.example.com",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "sms_fallback_method": "http_method",
          "sms_fallback_url": "http://www.example.com",
          "sms_method": "http_method",
          "sms_url": "http://www.example.com",
          "voice_fallback_method": "http_method",
          "voice_fallback_url": "http://www.example.com",
          "voice_method": "http_method",
          "voice_url": "http://www.example.com",
          "links": {
              "usage": "https://preview.twilio.com/wireless/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage",
              "rate_plan": "https://preview.twilio.com/wireless/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          },
          "rate_plan_sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "iccid": "iccid",
          "e_id": "e_id",
          "status": "status",
          "url": "https://preview.twilio.com/wireless/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.wireless.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.wireless.sims.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/wireless/Sims',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sims": [],
          "meta": {
              "first_page_url": "https://preview.twilio.com/wireless/Sims?Status=status&Iccid=iccid&RatePlan=rate_plan&PageSize=50&Page=0",
              "key": "sims",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/wireless/Sims?Status=status&Iccid=iccid&RatePlan=rate_plan&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.preview.wireless.sims.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sims": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "unique_name": "unique_name",
                  "commands_callback_method": "http_method",
                  "commands_callback_url": "http://www.example.com",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "friendly_name": "friendly_name",
                  "links": {
                      "usage": "https://preview.twilio.com/wireless/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage",
                      "rate_plan": "https://preview.twilio.com/wireless/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                  },
                  "rate_plan_sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "iccid": "iccid",
                  "e_id": "e_id",
                  "status": "status",
                  "sms_fallback_method": "http_method",
                  "sms_fallback_url": "http://www.example.com",
                  "sms_method": "http_method",
                  "sms_url": "http://www.example.com",
                  "voice_fallback_method": "http_method",
                  "voice_fallback_url": "http://www.example.com",
                  "voice_method": "http_method",
                  "voice_url": "http://www.example.com",
                  "url": "https://preview.twilio.com/wireless/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "first_page_url": "https://preview.twilio.com/wireless/Sims?Status=status&Iccid=iccid&RatePlan=rate_plan&PageSize=50&Page=0",
              "key": "sims",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/wireless/Sims?Status=status&Iccid=iccid&RatePlan=rate_plan&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.preview.wireless.sims.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.wireless.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/wireless/Sims/DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "commands_callback_method": "http_method",
          "commands_callback_url": "http://www.example.com",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "links": {
              "usage": "https://preview.twilio.com/wireless/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage",
              "rate_plan": "https://preview.twilio.com/wireless/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          },
          "rate_plan_sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "iccid": "iccid",
          "e_id": "e_id",
          "status": "status",
          "sms_fallback_method": "http_method",
          "sms_fallback_url": "http://www.example.com",
          "sms_method": "http_method",
          "sms_url": "http://www.example.com",
          "voice_fallback_method": "http_method",
          "voice_fallback_url": "http://www.example.com",
          "voice_method": "http_method",
          "voice_url": "http://www.example.com",
          "url": "https://preview.twilio.com/wireless/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.wireless.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end