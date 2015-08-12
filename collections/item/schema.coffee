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
  isDummyData:
    type: Boolean
    defaultValue: false
