class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.references :user, foreign_key: true
      t.string :name, index: {unique: true}
      t.string :nick_name
      t.string :signature
    end
  end
end
