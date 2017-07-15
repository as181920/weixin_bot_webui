class Message < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :msg_id, :from, :to, :msg_type, :sender, :create_time
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

  def as_json
    {
      user: user.wxuin,
      msg_id: msg_id,
      msg_type_name: msg_type_name,
      from: from,
      to: to,
      sender: sender,
      content: (msg_type == 1 ? content : "..."),
      create_time: create_time.strftime("%F %T")
    }
  end
end
