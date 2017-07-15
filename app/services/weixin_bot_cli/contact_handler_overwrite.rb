module WeixinBotCli
  class ContactHandler
    def handle(contact)
      user = User.find_or_create_by(wxuin: bot.current_user["Uin"])
      contact = user.contacts.create(nick_name: contact["NickName"], signature: contact["Signature"], chat_group_name: contact["ChatGroupName"])
    end
  end
end

