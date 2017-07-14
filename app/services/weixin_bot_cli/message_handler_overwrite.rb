module WeixinBotCli
  class MessageHandler
    def handle(msg, bot)
      user = User.find_or_create_by(wxuin: bot.current_user["Uin"])
      sender_user_name, content = parse_msg_content(msg["Content"])

      if content.present?
        message = user.messages.create(
          msg_id: msg["MsgId"],
          from_user_name: msg["FromUserName"],
          to_user_name: msg["ToUserName"],
          msg_type: msg["MsgType"],
          create_time: Time.at(msg["CreateTime"]),
          sender_user_name: sender_user_name,
          content: content
        )
        BotMessageBroadcastJob.perform_later("bot.message.#{message.user.wxuin}", message.pretty.to_json)
      end

      if content =~ /@#{bot.current_user["NickName"]}/
        return {Content: "@#{bot.full_contact_info_hash[sender_user_name] || sender_user_name} 哼", Type: 1}
      end
    end

    private
    def parse_msg_content(content)
      if content =~ /^@\w{10,99}:<br\/>/
        sender_user_name, real_content = content.split(":<br/>", 2)
        return [sender_user_name, format_content(real_content)]
      else
        return [bot.current_user["UserName"], format_content(content)]
      end
    end
  end
end
