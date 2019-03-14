App.message = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    console.log("websocket Client Connected")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->

  	keys = Object.values(data)
  	document.body.scrollTop = document.body.scrollHeight
   $('#admin_chat').append("<li class='other'> <div class='avatar'><img src="+keys[0]["message"]["avatar"]+" /></div> <div class='msg'> <p>"+keys[0]["message"]["content"]+"</p> <time>"+keys[0]["message"]["time"]+"</time> </div> </li>");
   window.scrollTo(0, 9999999999999999999999999);


  send_msg: (data)->
    @perform 'send_msg', message:data
    console.log(data)



