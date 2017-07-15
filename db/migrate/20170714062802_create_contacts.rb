class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.references :user, foreign_key: true
      t.string :nick_name
      t.string :signature
      t.string :chat_group_name

      t.datetime :created_at
    end
  end
end
