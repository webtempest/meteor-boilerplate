// https://github.com/asyncly/EventEmitter2
//  E.on 'foo.*', (value1, value2) ->
//    console.log @event, value1, value2
//  E.off 'foo.*', callback
//  E.emit 'foo.bazz'
//  E.emit ['foo', 'bazz']
//  E.onAny (value) ->
//    console.log 'on every event:', value
//  E.once 'foo.bazz', ->
//    console.log 'this will listen once then explode'
//  E.many 'foo.bazz', 4, (value) ->
//    console.log 'this will listen 4 times then explode'

var EventEmitter2 = Npm.require('eventemitter2').EventEmitter2;

E = new EventEmitter2({
  wildcard: true,
  delimiter: '.',
  newListener: false,
  maxListeners: 10
});
