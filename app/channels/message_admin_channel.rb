class MessageAdminChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_admin"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def admin_send_msg(data)
  	ActionCable.server.broadcast "room_admin", message:data
  end
end
