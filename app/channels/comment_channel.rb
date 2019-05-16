class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comment_product"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_comment(data)
  	ActionCable.server.broadcast "comment_product", comment:data
  end
   
  def return_comment(data)
  	ActionCable.server.broadcast "comment_product", comment:data
  end

end
