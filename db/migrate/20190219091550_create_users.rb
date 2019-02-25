class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.date :birthday
      t.string :password
      t.string :password_digest
      t.integer :group, null: false, default: 0
      t.string :remember_digest

      t.timestamps
    end
  end
end
