App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
         console.log("websocket Connected from notification")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data['notification']['notification']['notification'] == 'comment_success'
       $('#toast'+data['notification']['notification']["user_id"]).parent('.ring_ring').addClass( "ring_ring_turn_off" );
       x =  $('#toast'+data['notification']['notification']["user_id"]).children().length
       $("#closetoast").css('display','block');
       $('#toast'+data['notification']['notification']["user_id"]).append("<div class='toast' data-autohide='false'> <div class='toast-header'> <strong class='mr-auto text-primary'>Browse comment</strong> <small class='text-muted'>less than a minute</small> </div> <div class='toast-body'> "+data['notification']['notification']["content"]+" </div> </div>");
       if x == 4 
        $('#toast'+data['notification']['notification']["user_id"]).children('div')[1].remove();
 
    if data['notification']['notification']['notification'] == 'comment_fail'
       $('#toast'+data['notification']['notification']["user_id"]).parent('.ring_ring').addClass( "ring_ring_turn_off" );
       x =  $('#toast'+data['notification']['notification']["user_id"]).children().length
       $("#closetoast").css('display','block');
       $('#toast'+data['notification']['notification']["user_id"]).append("<div class='toast' data-autohide='false'> <div class='toast-header'> <strong class='mr-auto text-primary'>Browse comment</strong> <small class='text-muted'>less than a minute</small> </div> <div class='toast-body'> "+data['notification']['notification']["content"]+" </div> </div>");
       if x == 4 
        $('#toast'+data['notification']['notification']["user_id"]).children('div')[1].remove(); 

  send_notification_comment: (data)->
    @perform 'send_notification_comment' , notification:data
    console.log(data)
