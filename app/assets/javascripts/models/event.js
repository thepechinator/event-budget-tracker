EventBudgetTracker.module("Models", function(Models, EventBudgetTracker, Backbone, Marionette, $, _) {
	// represents just one model
	Models.Event = Backbone.Model.extend({
		urlRoot: "events"
	});

	// a collection of our individual models
	Models.EventCollection = Backbone.Collection.extend({
		url: "events",
		model: Models.Contact,
	});

	// API to get information out for this model
	var API = {

	};

	EventBudgetTracker.reqres.setHandler("event:models", function() {
		// get a list of models
	});

	EventBudgetTracker.reqres.setHandler("event:model") function() {
		// get one model
	});
});
