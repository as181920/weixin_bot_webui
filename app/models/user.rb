class User < ApplicationRecord
  validates :wxuin, presence: true, uniqueness: true
  has_many :contacts, dependent: :destroy
  has_many :messages

  def as_json
    {
      wxuin: wxuin,
      nick_name: nick_name,
      signature: signature,
      created_at: created_at.strftime("%F %T"),
      updated_at: updated_at.strftime("%F %T")
    }
  end
end
