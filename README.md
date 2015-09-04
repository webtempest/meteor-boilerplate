# Meteor Boilerplate

![img](https://cloud.githubusercontent.com/assets/184383/9678528/9f80b4ae-5329-11e5-88e0-be9d8f169360.png)

For starting new projects. I tried to include files that utilize the provided packages as a reference on how to use them. They are in Coffeescript at the moment. If you like Javascript you can still get the gist of how I'm using them - just ignore/delete them as they are not required.

[Accompanying cheat sheet](http://www.webtempest.com/meteor-js-cheatsheet)

## Packages

```
meteor-platform
coffeescript
fourseven:scss
aldeed:collection2
matb33:collection-hooks
accounts-password
accounts-facebook
momentjs:moment
reywood:publish-composite
dburles:collection-helpers
reactive-var
reactive-dict
zimme:active-route
alanning:roles
dburles:factory
digilord:faker
msavin:mongol
service-configuration
arillo:flow-router-helpers
kadira:flow-router
kadira:blaze-layout
useraccounts:flow-routing
useraccounts:bootstrap
mplatts:accounts-ui-bootstrap-4
meteorhacks:npm
npm-container
mplatts:event-emitter2
```

## Features

- Flow router installed
- Bootstrap 4 manually installed (remove client/lib/bootstrap if you don't want it)
- custom accounts UI works with Bootstrap 4
- eventEmitter2 installed on server - called E (E.emit('event', val))
- User schema setup
- Example file structure for collections
- Facebook sign up captures name, email and profile picture URL
- loading bar when websockets is active (like Youtube load bar up the top of the screen)
- `formattedDate` helper for date formatting
- loading bar like Youtube's is shown up top when DDP on the go

## Usage

### Clone and rename

```
git clone git@github.com:webtempest/meteor-boilerplate.git projectname
cd projectname
```

### Adding Facebook sign in

Get your app ID and secret and put it in your `settings.json` (see `settings-example.json`). If you look in `server/setup/facebook.coffee` I create the Facebook service provider and make it so name, email and profile picture is stored in the user's profile (if they sign up via Facebook).

### Remove helper files

There are files dotted around in certain folders to help you get started. Mostly you can just keep them there and use them as a reference. Though you'll probably want to change `/both/routes`.

## Decisions

### Folder/files

Folder/file naming and patterns used are opinionated and open for debate. Please create issues or PR's for suggested new patterns.

Templates are named like this:

`items/item.html` => `itemsItem`
`items/new_item.html` => `itemsNewItem`
`layouts/public.html` => `layoutsPublic`

### Coffeescript vs Javascript

I've used both professionally and in my opinion Coffeescript is a hands down winner - it seems to make coding Javascript quicker and more enjoyable with no apparent downsides. I wrote [a blog post](http://www.webtempest.com/learn-coffeescript-fast) to help people learn it quickly (only takes about 15-30 mins to learn). Well worth it I promise.

### Why not use packages?

[Telescope](https://github.com/TelescopeJS/Telescope) (a large and successful open source Meteor app) doesn't actually have any application code. Rather the creators have split the project into packages.

Packages offer better modularity and the ability to specify dependencies. In larger projects I would seriously consider using this pattern.
