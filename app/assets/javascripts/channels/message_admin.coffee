App.message_admin = App.cable.subscriptions.create "MessageAdminChannel",
  connected: ->
     console.log("websocket Client Connected for admin")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	keys = Object.values(data)
   $('#setscroll').append(" <div class='row msg_container base_receive'><div class='col-md-2 col-xs-2 avatar-custom1'><div class='col-xs-10 col-md-10'><div class='messages msg_receive'><p>"+keys[0]["message"]["content"]+"</p><time >"+keys[0]["message"]["time"]+"</time</div></div></div></div>");
    # Called when there's incoming data on the websocket for this channel

  admin_send_msg: (data)->
    @perform 'admin_send_msg', message:data
    console.log(data)
