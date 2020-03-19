<script>
function eventCalendar(){
  return $('#calendar').fullCalendar
  ({googleCalendarApiKey: gon.google_calendar_api_key,
    eventSources: getEventSources(),
    }
  );
};

eventsSources:[
                {googleCalendarId: whatever, color:whatever, textcolor:whatever}
              ],
events: <%= @bookings.each do |b|
                b.start
                b.end %>
