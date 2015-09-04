# Here I put methods I need to help me populate the app. Allows me to quickly
# fill up the app with data from a simple console call.

# Only expose the method in development mode
if process.env.NODE_ENV == "development"
  Meteor.methods

    # In browser console: `Meteor.call('addUsers', 10)` => creates 10 random users 
    addUsers: (amount) ->
      for i in [1..amount]
        Factory.create('user')
