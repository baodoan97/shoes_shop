App.message = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    console.log("websocket Client Connected")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   keys = Object.values(data)
   $.ajax '/admins/messages/received',
   type: 'POST'
   dataType: 'script'
   data: { data }
   success: (data, textStatus, jqXHR) ->
   console.log(data)


  send_msg: (data)->
    @perform 'send_msg', message:data
    console.log(data)



