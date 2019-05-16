App.comment = App.cable.subscriptions.create "CommentChannel",
  connected: ->
        console.log("websocket Comment Connected")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    keys = Object.values(data)
    if keys[0]["comment"]["display"] == true
       $('#comment'+keys[0]["comment"]["product_id"]+ ' > div:last-child').remove(); 
       $('#comment'+keys[0]["comment"]["product_id"]).prepend("<div class='media'><img src="+keys[0]['comment']['avatar']+" class='imgcomment align-self-start mr-3'> <br /><div class='media-body bg-light-custom mt-3'><h5 class='mt-0'>"+keys[0]['comment']['name']+"<small><i>"+keys[0]['comment']['updated_at']+"</i></small></h5><p>"+keys[0]['comment']['content']+"</p></div></div>");
    if keys[0]["comment"]["display"] == false 
       $.ajax '/admins/comments/newcomment',
       type: 'POST'
       dataType: 'script'
       data: { data }
       success: (data, textStatus, jqXHR) ->
       console.log(data)
    # Called when there's incoming data on the websocket for this channel

  send_comment: (data)->
    @perform 'send_comment', comment:data
    console.log(data)

  return_comment: (data)->
    @perform 'return_comment', comment:data
    console.log(data)
