FlowRouter.route '/',
  name: 'home'
  action: ->
    BlazeLayout.render("layoutsPublic", {content: "publicHome"})

FlowRouter.route '/sign-out',
  name: 'signOut'
  action: ->
    Meteor.logout()
    FlowRouter.redirect '/'
    
#FlowRouter.triggers.enter([AccountsTemplates.ensureSignedIn])
