@EventBudgetTracker.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Event extends Backbone.Model

  class Entities.EventsCollection extends Backbone.Collection
    model: Entities.Event
    url: -> Routes.events_path()


  API =
    # setCurrentUser: (currentUser) ->
    #   new Entities.User currentUser

    getEventEntities: (cb) ->
      events = new Entities.EventsCollection
      events.fetch
        success: ->
          console.log 'events'
          console.log events
          cb(events)

  # App.reqres.addHandler "set:current:user", (currentUser) ->
  #   API.setCurrentUser currentUser

  App.reqres.setHandler "event:entities", (cb) ->
    API.getEventEntities(cb)