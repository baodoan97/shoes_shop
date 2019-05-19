App.message_admin = App.cable.subscriptions.create "MessageAdminChannel",
  connected: ->
     console.log("websocket Client Connected for admin")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
     $.ajax '/messages/received',
     type: 'POST'
     dataType: 'script'
     data: { data }
     success: (data, textStatus, jqXHR) ->
     console.log(data)

  admin_send_msg: (data)->
    @perform 'admin_send_msg', message:data
    console.log(data)
