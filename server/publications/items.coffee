# Example of publishComposite, which allows children
# So in this case we'd expect Item has_many SubItems 
# (SubItems have itemId pointing to Item)

Meteor.publishComposite 'items', ->
  find: ->
    Items.find({userId: @userId})
  children: [
    find: (item) ->
      SubItems.find({itemId: item._id})
  ]

