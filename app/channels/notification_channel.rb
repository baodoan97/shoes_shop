class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_notification_comment(data)
      ActionCable.server.broadcast "notification_channel", notification:data
  end
end
