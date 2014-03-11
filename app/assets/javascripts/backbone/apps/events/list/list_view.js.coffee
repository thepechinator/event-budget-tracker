@EventBudgetTracker.module "EventsApp.List", (List, App, Backbone, Marionette, $, _) ->

  # Notice how all the views for this particular 'list' is contained
  # here.. the layout, the item view, etc
  class List.Layout extends Marionette.Layout
    template: "events/list/templates/list_layout"

    regions:
      panelRegion: "#panel-region"
      eventsRegion: ".events"

  class List.Panel extends Marionette.ItemView
    template: "events/list/templates/_panel"

  class List.Event extends Marionette.ItemView
    template: "events/list/templates/_event"
    tagName: "tr"
    events:
      "click a.show": -> @trigger "show:event", @model

  class List.Events extends Marionette.CompositeView
    template: "events/list/templates/_events"
    itemView: List.Event
    itemViewContainer: "tbody"