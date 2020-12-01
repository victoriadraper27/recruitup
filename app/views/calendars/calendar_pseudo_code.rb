
# Calendar can be generated with an array of events
# so pass an array of events to calendar.

# Golf Recruiting Dates
# April 15, 2021 - November 9, 2021 & November 26-29, 2021

# College Golf Season
# Sunday - Monday - Tueaday (13 weekends)
# September 1, 2021 - October 31,2021 (3-4 weekends)
# Feburary 1, 2021 - May 1, 2021 (8-9 weekends)

# Only 3 contacts per Athlete a year

# dead_period = (11/29/2021..3/15/2022).to_a
# dead_week = [11/10/2021..11/25/2021].to_a

# @events = Event.all

# available_events = @events.reject do |event|
#   dead_period.include?(event) || dead_week.include?(event)
# end

# Once I have only have events in which a are legal recruting dates,
# I need to group the events by dates and then my location.
# I then need to inject my event card, into my "calendar table" where my calendar
# table cell matches the date of the event/events.

# <h1>Calendar</h1>

# <% start_date = params.fetch(:start_date, Date.today).to_date %>
# <% date_range = (start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).to_a %>
# <% date_range.each_slice(7) do |week| %>
#   <div><%= week %></div>
# <% end %>

# <table>
#   <thead>
#     <tr>
#       <% date_range.slice(0, 7).each do |day| %>
#         <th><%= I18n.t("date.abbr_day_names")[day.wday] %></th>
#       <% end %>
#     </tr>
#   </thead>

#   <tbody>
#     <% date_range.each_slice(7) do |week| %>
#       <tr>
#         <% week.each do |day| %>
#           <td><%= day %></td>
#         <% end %>
#       </tr>
#     <% end %>
#   </tbody>
# </table>

