class WelcomeController < ApplicationController
  def index
    @uuid = WeixinBotCli::Bot.get_uuid
    Thread.new(@uuid) do |id|
      bot = WeixinBotCli::Bot.new(id)
      bot.logger = Logger.new("#{Rails.root}/log/weixin_bot.log")
      bot.run
    end
  end

  def fake_contacts
    @uuid = WeixinBotCli::Bot.get_uuid
    Thread.new(@uuid) do |id|
      bot = WeixinBotCli::Bot.new(id)
      bot.logger = Logger.new("#{Rails.root}/log/weixin_bot.log")
      bot.confirm_login
      bot.get_cookie
      bot.get_init_info
      bot.open_status_notify
      bot.get_contact
      Thread.new(bot) do |b|
        b.get_fake_contact
      end
      bot.get_group_member
      bot.sync_message
    end
  end
end
