# Permissions are set on the server.
# So alternatively I could have put this in a 'server' folder.
# But I don't mind the extra `if Meteor.isServer` line
#
# Here if logged in user is admin or is the owner 
# of the item then they can do whatever they want

adminOrOwner = (userId, doc) ->
  if Roles.userIsInRole(userId, 'admin')
    true
  else
    doc && doc.userId == userId

if Meteor.isServer
  Items.allow
    insert: adminOrOwner
    remove: adminOrOwner
    update: adminOrOwner
