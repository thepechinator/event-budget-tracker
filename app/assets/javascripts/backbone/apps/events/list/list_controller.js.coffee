@EventBudgetTracker.module "EventsApp.List", (List, App, Backbone, Marionette, $, _) ->
  List.Controller =
    listEvents: ->
      # Part of the messaging bus
      # Assume this is being returned a collection
      events = App.request("events:entities")

      @layout = @getLayoutView()

      # events are fired on the view instance
      @layout.on("show", =>
        # wait until show is fired
        @showPanel(events)
        @listEvents(events)
      )

      App.mainRegion.show(@layout)

    # List Events
    listEvents: (events) ->
      eventsView = @getEventsView(events)
      eventsView.on "itemview:edit:event", (iv, event) ->
        App.vent.trigger("edit:event", event)

      @layout.tableRegion.show(eventsView)

    getEventsView: (events) ->
      new List.Events(
        collection: events
      )

    # Panel Code
    showPanel: (events) ->
      panelView = @getPanelView(events)
      @layout.panelRegion.show(panelView)

    getPanelView: (events) ->
      # An ItemView actually does NOT represent one item
      # in particular.
      new List.Panel(
        { collection: events }
      )

    getLayoutView: ->
      new List.Layout