module WeixinBotCli
  class MessageHandler
    def handle(msg, bot)
      user = User.find_or_create_by(wxuin: bot.current_user["Uin"])
      sender, content = parse_msg_content(msg)

      # persist record
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

      # reply
      return nil if sender == bot.current_user["NickName"] # skip myself message

      if content =~ /^@#{bot.current_user["NickName"]}\W+h/
        return {Content: "@#{sender} 哼", Type: 1}
      elsif content =~ /^@#{bot.current_user["NickName"]}\W+tl/
        info = content.split(" tl", 2)[-1]
        reply = get_tuling123_reply(info)
        return {Content: reply, Type: 1} if reply
      else
      end
    end

    private
      def get_tuling123_reply(info)
        resp = Faraday.post "http://www.tuling123.com/openapi/api", {key: ENVConfig.tuling123_api_key, info: info, userid: "181920}"}
        JSON.load(resp.body)['text']
      rescue => e
        puts "#{e.class.name}: #{e.message}"
        return nil
      end
  end
end
