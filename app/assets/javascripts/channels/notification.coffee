App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
  disconnected: ->
  received: (data) ->
    console.log('new notification arrived')
    $('#notifications_in_header').empty().html(data.notifications)
