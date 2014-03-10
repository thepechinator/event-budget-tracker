(function($, EventBudgetTracker) {
  EventBudgetTracker.module("EventsApp", function(EventsApp, App, Backbone, Marionette, $, _) {
    EventsApp.Router = Marionette.AppRouter.extend({
      // only applies to user manually putting in URL
      appRoutes: {
        "events": "listEvents",
        "events/:id": "showEvent",
        "events/:id/edit": "editEvent"
      }
    });


    var API = {
      editEvent: function(id) {
        EventsApp.Edit.Controller.editEvent(id);
      },
      showEvent: function(id) {
        EventsApp.Show.Controller.showEvent(id);
      },
      listEvents: function() {
        EventsApp.List.Controller.listEvents();
      }
    };


    App.vent.on("edit:event", function(event) {
      // this will NOT fire the router calls, which is GOOD
      Backbone.history.navigate("events/" + event.id + "/edit");
      API.editEvent(event.id);
    });


    App.addInitializer(function() {
      new EventsApp.Router({
        controller: API
      });
    });
  });
})(jQuery, window.EventBudgetTracker);