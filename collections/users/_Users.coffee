Meteor.users.helpers

  isAdmin: ->
    Roles.userIsInRole(@_id, 'admin')
