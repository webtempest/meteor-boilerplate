if Meteor.isClient
  isFunction = (functionToCheck) ->
   getType = {}
   functionToCheck && getType.toString.call(functionToCheck) == '[object Function]'

  isMeteorSubscription = (name) ->
    (name.indexOf("meteor.")==0 || name.indexOf("meteor_")==0)

  Meteor.startup ->
    Meteor._originalSubscribe = Meteor.subscribe

    Meteor.subscribe = (subscribeName) ->
      if subscribeName && !isMeteorSubscription(subscribeName)

        # preserves original onReady and onError functions
        newArgs = arguments
        callbacks = {}

        _this = this

        params = Array.prototype.slice.call(arguments, 1)

        makeFn = (fn) ->
          return ->
            if document.body
              NProgress.done()
            if fn
              fn.apply(_this, arguments)

        cut = (args) ->
          Array.prototype.slice.call(args, 0, args.length - 1)

        if(arguments.length > 1)

          lastObj = arguments[arguments.length - 1]

          if(lastObj)
            if(isFunction(lastObj))
              callbacks.onReady = makeFn(lastObj)
              newArgs = cut(arguments)
            else
              if(lastObj.onReady && isFunction(lastObj.onReady))
                callbacks.onReady = makeFn(lastObj.onReady)
                newArgs = cut(arguments)

              if(lastObj.onError && isFunction(lastObj.onError))
                callbacks.onError = makeFn(lastObj.onError)
                newArgs = cut(arguments)

        if(!callbacks.onReady)
          callbacks.onReady = makeFn()

        if(!callbacks.onError)
          callbacks.onError = makeFn()

        Array.prototype.push.call(newArgs, callbacks)

        if document.body
          NProgress.start()
          c = setInterval (->
            if(document.body && DDP._allSubscriptionsReady())
              NProgress.done()
              clearInterval(c)
          ), 80
        handle = Meteor._originalSubscribe.apply(_this, newArgs)
        handle

    Meteor.withoutBar =
      subscribe: Meteor._originalSubscribe
