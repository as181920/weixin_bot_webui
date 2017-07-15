class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :wxuin, index: {unique: true}
      t.string :nick_name
      t.string :signature

      t.timestamps
    end
  end
end
