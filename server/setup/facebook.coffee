Meteor.startup ->
  if Meteor.settings.private?.facebook?
    appId = Meteor.settings.private.facebook.appId
    appSecret = Meteor.settings.private.facebook.appSecret

    ServiceConfiguration.configurations.upsert(
      { service: "facebook" },
      { $set: { appId: appId, secret: appSecret } }
    )

    # Captures Facebook name and email and profile picture and puts it into the user's profile
    # User profile schema requires name, email and profilePictureUrl
    Accounts.onCreateUser (options, user) ->
      if user.services.facebook != null
        if !user.profile
          user.profile = {}

        fb = user.services.facebook
        return unless fb
        profile = user.profile
        whitelist = {
          name: 'name',
          email: 'email'
        }

        _(whitelist).each (val, key) ->
          if fb[val]? and !profile[key]
            profile[key] = fb[val]

        # Set profile picture
        profile['profilePictureUrl'] = 'http://graph.facebook.com/' + fb.id + '/picture/?type=large'

        _(user.profile).extend(profile)

      user
