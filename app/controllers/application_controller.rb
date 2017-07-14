require "weixin_bot_cli/user_handler_overwrite"
require "weixin_bot_cli/contact_handler_overwrite"
require "weixin_bot_cli/message_handler_overwrite"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
