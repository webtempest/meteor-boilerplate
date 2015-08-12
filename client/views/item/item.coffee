# Lets say you have two separate click events
# and you want to do the same thing in both. How
# would you do this? Here is how I have been doing it.
# If you have a better way please create an issue thanks!

helpers =
  toggle: (e, tpl) ->
    tpl.$('.js-text-item, .js-text-item-input').toggleClass('hide')
    tpl.$('.textContent').focus() if tpl.$('.textContent').is(':visible')

  save: (e, tpl) ->
    content = $.trim tpl.$('.textContent').val()
    Items.update({_id: @_id}, $set: {content: content})
    tpl.editing.set(false)
    helpers.toggle.call(@, e, tpl)

  cancel: (e, tpl) ->
    old = tpl.oldText.get()
    tpl.$('.textContent').text(old)
    tpl.editing.set(false)
    helpers.toggle.call(@, e, tpl)

Template.text.events
  'click .js-text-item': (e, tpl) ->
    tpl.oldText.set(tpl.$('.textContent').text())
    tpl.editing.set(true)
    helpers.toggle.call(@, e, tpl)

  'focusout input.textContent, keydown input.textContent, keyup input.textContent': (e, tpl) ->
    return unless tpl.editing.get()

    # If esc key was pressed...
    if e.type == "keydown" and e.which == 27
      helpers.cancel.call(@, e, tpl)

    # Else if enter was pressed or user clicked out of the input box
    else if e.type == "keyup" and e.which == 13 or e.type == 'focusout'
      helpers.save.call(@, e, tpl)

Template.text.onCreated ->

  # Use template instance level reactive vars instead of Session, which is global
  # @ (which is `this`) is the template instance
  # The template instance is handily passed as a parameter into you event handlers above
  @oldText = new ReactiveVar()
  @editing = new ReactiveVar(false) # false is the initial value
