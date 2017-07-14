class BotEventChannel < ApplicationCable::Channel
  def subscribed
    stream_from "bot.event.#{params[:bot_uuid]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
