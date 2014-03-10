EventBudgetTracker = new Marionette.Application()

  # Models: {}
  # Collections: {}
  # Views: {}
  # Routers: {}
  # initialize: -> alert 'Hello from Backbone!'

EventBudgetTracker.on("initialize:after", ->
  alert 'Backbone Marionette Initialized'

	if (Backbone.history)
		Backbone.history.start()

		if (@.getCurrentRoute() == "")
			EventBudgetTracker.trigger("")
)