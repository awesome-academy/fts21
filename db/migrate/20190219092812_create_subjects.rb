class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name, unique: true
      t.text :description
      t.integer :time_day
      t.boolean :status, default: true
      t.integer :suppervisor_id

      t.timestamps
    end
  end
end
