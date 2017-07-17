class BotContactChannel < ApplicationCable::Channel
  def subscribed
    stream_from "bot.contact.#{params[:user_wxuin]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
