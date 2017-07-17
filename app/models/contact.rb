class Contact < ApplicationRecord
  belongs_to :user

  def as_json
    {
      user: user.wxuin,
      nick_name: nick_name,
      signature: signature,
      status: status
    }
  end
end
