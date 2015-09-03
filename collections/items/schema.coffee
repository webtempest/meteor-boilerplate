Items.attachSchema new SimpleSchema
  userId:
    type: String
    index: 1
  name:
    type: String
    max: 200
  content:
    type: String
  type:
    type: String
    allowedValues: ['typeOne', 'typeTwo']
    defaultValue: 'typeOne'
    index: 1
  createdAt:
    type: Date
    autoValue: ->
      if @isInsert
        new Date
      else if @isUpsert
        $setOnInsert: new Date
      else
        @unset()
  updatedAt:
    type: Date
    autoValue: ->
      if @isUpdate
        new Date()
    denyInsert: true
    optional: true
  isDummyData:
    type: Boolean
    defaultValue: false
