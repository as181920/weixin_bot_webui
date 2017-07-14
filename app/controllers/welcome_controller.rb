class WelcomeController < ApplicationController
  def index
    @uuid = WeixinBotCli::Bot.get_uuid
    Thread.new(@uuid) do |id|
      bot = WeixinBotCli::Bot.new(id)
      bot.logger = Logger.new("#{Rails.root}/log/weixin_bot.log")
      bot.run
    end
  end

  def test
  end
end
