@Items = new Mongo.Collection('items')

Items.helpers

  # item = Items.findOne({_id: id})
  # item.change({name: 'New name'})
  change: (attributes)->
    Items.update({_id: @_id}, $set: attributes)

  # If an Item has_many SubItems you can retrieve them with this helper
  subItems: ->
    SubItems.find(itemId: @_id).fetch()

  # Shows how you can reference other helpers within a helper
  markAsChanged: ->
    unless @changedSinceCreation
      @change(changedSinceCreation: true)
