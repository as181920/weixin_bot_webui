module WeixinBotCli
  class UserHandler
    def handle(user)
      User.find_or_initialize_by(wxuin: user["Uin"]).update(name: user["UserName"], nick_name: user["NickName"], signature: user["Signature"])
    end
  end
end
