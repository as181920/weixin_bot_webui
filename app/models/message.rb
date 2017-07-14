class Message < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :msg_id, :from_user_name, :to_user_name, :msg_type, :create_time
  validates_uniqueness_of :msg_id

  def msg_type_name
    {
      1     => "文本消息",
      3     => "图片消息",
      34    => "语音消息",
      37    => "好友确认消息",
      40    => "POSSIBLEFRIEND_MSG",
      42    => "共享名片",
      43    => "视频消息",
      47    => "动画表情",
      48    => "位置消息",
      49    => "分享链接",
      50    => "VOIPMSG",
      51    => "微信初始化消息",
      52    => "VOIPNOTIFY",
      53    => "VOIPINVITE",
      62    => "小视频",
      9999  => "SYSNOTICE",
      10000 => "系统消息",
      10002 => "撤回消息"
    }[msg_type]
  end

  def from
    Contact.find_by(name: from_user_name)&.nick_name || from_user_name
  end

  def to
    Contact.find_by(name: to_user_name)&.nick_name || to_user_name
  end

  def sender
    Contact.find_by(name: sender_user_name)&.nick_name || sender_user_name
  end
end
