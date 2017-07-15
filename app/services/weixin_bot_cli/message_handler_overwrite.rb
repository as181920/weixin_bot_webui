module WeixinBotCli
  class MessageHandler
    def handle(msg, bot)
      user = User.find_or_create_by(wxuin: bot.current_user["Uin"])
      sender, content = parse_msg_content(msg)

      if content.present?
        message = user.messages.create(
          msg_id: msg["MsgId"],
          from: bot.contact_name_pairs[msg["FromUserName"]] || msg["FromUserName"],
          to: bot.contact_name_pairs[msg["ToUserName"]] || msg["ToUserName"],
          msg_type: msg["MsgType"],
          create_time: Time.at(msg["CreateTime"]),
          sender: sender,
          content: content
        )
        BotMessageBroadcastJob.perform_later("bot.message.#{message.user.wxuin}", message.as_json)
      end

      if content =~ /@#{bot.current_user["NickName"]}/
        return {Content: "@#{sender} 哼", Type: 1}
      end
    end
  end
end
