json.array!(@event_list) do |event|
  json.extract! event, :id, :start, :end
  json.title event.creator.email
  json.url event_url(event, format: :html)
end
