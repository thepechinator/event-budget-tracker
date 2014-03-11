@EventBudgetTracker.module "EventsApp.List", (List, App, Backbone, Marionette, $, _) ->
  List.Controller =
    listEvents: ->
      # Part of the messaging bus
      # Assume this is being returned a collection
      events = App.request("event:entities", (events) =>
        @layout = @getLayoutView()

        # events are fired on the view instance
        @layout.on("show", =>
          # wait until show is fired
          # @showPanel(events)
          @showEvents(events)
        )

        App.mainRegion.show(@layout)
      )

    # Show Different Views
    #
    #
    showEvents: (events) ->
      eventsView = @getEventsView(events)
      eventsView.on "itemview:show:event", (iv, event) ->
        App.vent.trigger("show:event", event)

      # console.log eventsView
      @layout.eventsRegion.show(eventsView)

    # Panel Code
    showPanel: (events) ->
      panelView = @getPanelView(events)
      @layout.eventsRegion.show(panelView)


    # Retrieve actual view
    #
    #
    getEventsView: (events) ->
      new List.Events(
        collection: events
      )

    getPanelView: (events) ->
      # An ItemView actually does NOT represent one item
      # in particular.
      new List.Panel(
        { collection: events }
      )

    getLayoutView: ->
      new List.Layout