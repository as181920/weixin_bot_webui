module WeixinBotCli
  class ContactHandler
    def handle(contact)
      user = User.find_or_create_by(wxuin: bot.current_user["Uin"])
      user.contacts.find_or_initialize_by(name: contact["UserName"]).update(nick_name: contact["NickName"], signature: contact["Signature"])
    end
  end
end

