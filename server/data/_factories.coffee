# Here you create factories that allow you to create random data for your app
# Very useful in development, when you want to test your app with different amounts
# of data. 
#
# Faker is a popular random word generator.
# Learn the faker functions: https://github.com/marak/Faker.js
#

# user = Factory.create('user')
# OR (to override certain attributes)
# user = Factory.create('user', {username: 'override_username'})
Factory.define 'user', Meteor.users,
  username: -> faker.internet.userName() + _.random(0,1000)
  profile: ->
    name: faker.name.findName()
    profilePictureUrl: "/images/test/user" + _.random(1,7) + ".jpg"
    phone: faker.phone.phoneNumber()
  emails: ->
    email = faker.internet.email()
    [{
      address: email,
      verified: true
    }]

  createdAt: new Date()
  isDummyData: true

Factory.define 'item', Item,
  content: -> faker.lorem.paragraphs(_.random(1,3))
  createdAt: new Date()
  isDummyData: true

# I add `isDummyData` on the end so it's easy to remove dummy data if need be (Items.remove({isDummyData: true}))
