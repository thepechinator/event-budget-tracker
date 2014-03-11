@EventBudgetTracker = do (Backbone, Marionette) ->
  App = new Marionette.Application

  # This includes a prepended slash
  App.rootRoute = Routes.events_path()

  App.addRegions
    headerRegion: ".header"
    mainRegion: ".main"
    footerRegion: ".footer"

  App.addInitializer ->
    # do something with modules

  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()

      @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

  App