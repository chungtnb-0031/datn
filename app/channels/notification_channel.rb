class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # Get the parameter from client side
    # Open stream for a parameterized channel
    stream_from "notification_channel_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
