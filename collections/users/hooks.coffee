Meteor.users.after.remove (userId, doc) ->
  Items.remove({userId: doc._id})
