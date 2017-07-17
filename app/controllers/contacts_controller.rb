class ContactsController < ApplicationController
  def fake
    @user = User.find_by(wxuin: params[:wxuin])
    @contacts = @user.contacts.where.not(status: nil).order("id desc")
  end
end
