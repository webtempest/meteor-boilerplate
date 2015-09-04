# Usage (in template file): 
# 
#   {{formattedDate createdAt}} => "Sunday, February 14th 2015, 3:25:50 pm"
#   {{formattedDate createdAt "DD/MM/YY"}} => "14/02/15"
#
# See http://momentjs.com/docs/#/displaying/ for more options

Template.registerHelper 'formattedDate', (timestamp, format = "dddd, MMMM Do YYYY, h:mm:ss a") ->
  moment(new Date(timestamp)).format(format)


# Usage (in template file): 
# 
#   {{fromNow createdAt}} => "an hour ago"

Template.registerHelper 'fromNow', (timestamp) ->
  moment(new Date(timestamp)).fromNow()
