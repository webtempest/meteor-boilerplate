# createdAt, updatedAt
Items.before.insert (userId, doc) ->
  doc.createdAt = new Date()

Items.before.update (userId, doc, fieldNames, modifier, options) ->
  modifier.$set = modifier.$set || {}
  modifier.$set.updatedAt = new Date()

Items.after.remove (userId, doc) ->

  # If Item has_many SubItems, you may want to remove them too
  SubItems.remove(textId: doc._id)
