module WeixinBotCli
  class UserHandler
    def handle(msg)
      user = User.find_or_initialize_by(wxuin: msg["Uin"])
      user.update(nick_name: msg["NickName"], signature: msg["Signature"])
      user.contacts.delete_all

      BotMessageBroadcastJob.perform_later("bot.event.#{bot.uuid}", user.as_json)
    end
  end
end
