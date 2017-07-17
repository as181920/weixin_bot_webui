module WeixinBotCli
  class ContactHandler
    def handle(msg)
      user = User.find_or_create_by(wxuin: bot.current_user["Uin"])
      contact = user.contacts.create(
        nick_name: msg["NickName"],
        signature: msg["Signature"],
        chat_group_name: msg["ChatGroupName"],
        status: msg["Status"]
      )
      BotMessageBroadcastJob.perform_later("bot.contact.#{contact.user.wxuin}", contact.as_json)
    end
  end
end

