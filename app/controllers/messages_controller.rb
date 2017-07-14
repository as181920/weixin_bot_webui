class MessagesController < ApplicationController
  def for
    user = User.find_by(wxuin: params[:wxuin])
    @messages = user.messages.order("id desc").page(params[:page]).per(params[:per] || 10)
  end

  def from
  end
end
