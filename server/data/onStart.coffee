Meteor.startup ->
  if Meteor.users.find().count() == 0
    myId = Accounts.createUser
      email: "a@a.com"
      password: "password"
      profile:
        name: "Matt Platts"
        gender: "male"
        profilePictureUrl: ""

    Roles.addUsersToRoles(myId, 'admin')
