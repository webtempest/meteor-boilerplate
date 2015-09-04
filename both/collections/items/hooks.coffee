Items.after.remove (userId, doc) ->

  # If Item has_many SubItems, you may want to remove them too
  SubItems.remove(textId: doc._id)
