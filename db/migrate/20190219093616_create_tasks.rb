class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, unique: true
      t.text :description
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
