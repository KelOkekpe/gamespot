json.array!(@calendar_list) do |calendar|
  json.extract! calendar, :id, :summary
  json.id calendar.id
  json.summary calendar.summary
end
