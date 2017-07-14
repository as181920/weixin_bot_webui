class BotMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "bot.message.#{params[:user_wxuin]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
