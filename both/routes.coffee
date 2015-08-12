# This file is only relevant if you use Iron Router
# Flow Router users please delete this

Router.route '/sign-in', name: 'signIn'
Router.route '/sign-out', ->
  AccountsTemplates.logout()

# Usually put these in both/controllers/
# But you'll probably delete them anyway

@PublicController = RouteController.extend
  layoutTemplate: 'publicLayout'

@SignInController = PublicController.extend
  action: ->
    @render('accounts')

requireLogin = ->
  if !Meteor.user()
    if Meteor.loggingIn()
      # spinner?
    else
      Router.go('/sign-in')
      @next()
  else
    @next()

requireNotLoggedIn = ->
  if Meteor.user() or Meteor.loggingIn()
    Router.go('/')
    @next()
  else
    @next()


Router.onBeforeAction requireLogin

Router.onBeforeAction(requireNotLoggedIn, {
  only: ['signIn']
})

AccountsTemplates.configure
  showForgotPasswordLink: true
  enablePasswordChange: true
