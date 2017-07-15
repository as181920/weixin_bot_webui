class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.string :msg_id
      t.string :from, index: true
      t.string :to
      t.integer :msg_type
      t.string :sender
      t.text :content
      t.timestamp :create_time

      t.datetime :created_at
    end
  end
end
