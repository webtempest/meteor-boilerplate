profileSchema = new SimpleSchema
  name:
    type: String
    optional: true

  profilePictureUrl:
    type: String
    optional: true

usersSchema = new SimpleSchema
  username:
    type: String
    optional: true

  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String,
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

  createdAt:
    type: Date

  profile:
    type: profileSchema
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    optional: true

  isDummyData:
    type: Boolean
    defaultValue: false

Meteor.users.attachSchema(usersSchema)
