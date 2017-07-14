module WeixinBotCli
  class UserHandler
    def handle(user)
      user = User.find_or_initialize_by(wxuin: user["Uin"])
      user.update(name: user["UserName"], nick_name: user["NickName"], signature: user["Signature"])
      # user.contacts.destroy_all

      BotEventBroadcastJob.perform_later("bot.event.#{bot.uuid}", user.to_json)
    end
  end
end
