if Meteor.isServer
  Meteor.users.allow
    remove: (userId, doc) ->
      Roles.userIsInRole(userId, 'admin')
