class MessagesController < ApplicationController
  def for
    @user = User.find_by(wxuin: params[:wxuin])
    @q = @user.messages.ransack(params[:q])
    @messages = @q.result.order("id desc").page(params[:page]).per(params[:per] || 10)
  end

  def from
    @user = User.find_by(wxuin: params[:wxuin])
    @q = @user.messages.where(from: params[:from]).ransack(params[:q])
    @messages = @q.result.order("id desc").page(params[:page]).per(params[:per] || 10)
  end
end
