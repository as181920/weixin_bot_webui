class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.string :msg_id
      t.string :from_user_name, index: true
      t.string :to_user_name
      t.integer :msg_type
      t.string :sender_user_name
      t.text :content
      t.timestamp :create_time

      t.datetime :created_at
    end
  end
end
