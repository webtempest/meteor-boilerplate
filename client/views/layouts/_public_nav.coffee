Template.layoutsPublicNav.onCreated ->
  Tracker.autorun ->
    if Session.get('mustLogin')
      $('.dropdown-toggle').click()
