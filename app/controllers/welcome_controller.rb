class WelcomeController < ApplicationController
  def index
    uuid = WeixinBotCli::Bot.get_uuid
    @qrcode = RQRCode::QRCode.new("https://login.weixin.qq.com/l/#{uuid}", :size => 4, :level => :l)
    Thread.new(uuid) do |id|
      bot = WeixinBotCli::Bot.new(id)
      bot.logger = Logger.new("#{Rails.root}/log/weixin_bot.log")
      bot.run
    end
  end

  def test
  end
end
