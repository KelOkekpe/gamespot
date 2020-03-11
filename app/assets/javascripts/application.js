// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree
//= require jquery
//= require moment
//= require fullcalendar
//= require fullcalendar/gcal
//= require bootstrap
 //= require bootstrap-sprockets
//= require bootstrap-modal
//= require bootstrap-datepicker


@calendar_list = service.list_calendar_lists
googleCalendarId = ""
color_array = %w[black blue red green yellow]

@calendar_list.each do |cal|
    googleCalendarId = cal.id
    color = color_array.sample
    color_array.delete(color)
  end



function eventCalendar() {
  return $('#calendar').fullCalendar
  ({googleCalendarApiKey:ENV['GOOGLE_CALENDAR_API_KEY'],
    eventSources:[
      {
        googleCalendarId:'kelokekpe@gmail.com', color:'#FF7171', textColor:'white'
      },
      {
        url: '/bookings.json', color:'#8ac9e4', textColor:'white'
      },
      {
        url:'/events.json', color:'red', textColor:'white'
      }
    ]
    }
  );
};


function clearCalendar() {
  $('#calendar').fullCalendar('delete');
  $('#calendar').html('');
};

$(document).on('turbolinks:load', function(){
  eventCalendar();
});
$(document).on('turbolinks:before-cache', clearCalendar);
