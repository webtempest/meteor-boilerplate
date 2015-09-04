new FlowWrapper
  loadingTemplate: 'layoutsPublicLoading'
  accessDeniedTemplate: 'publicAccessDenied'
  routes:
    "/": "home=layoutsPublic>publicHome"
    "/protected": "protected!=layoutsPublic>publicProtected"

FlowRouter.route '/sign-out',
  name: 'signOut'
  action: ->
    Meteor.logout()
    FlowRouter.redirect '/'

FlowRouter.notFound =
  action: ->
    BlazeLayout.render('layoutsPublic', {content: 'publicNotFound'})
