EventBudgetTracker = new Marionette.Application()

  # Models: {}
  # Collections: {}
  # Views: {}
  # Routers: {}
  # initialize: -> alert 'Hello from Backbone!'

EventBudgetTracker.on("initialize:after", ->
	if (Backbone.history)
		Backbone.history.start()

		if (@.getCurrentRoute() == "")
			EventBudgetTracker.trigger("")
)