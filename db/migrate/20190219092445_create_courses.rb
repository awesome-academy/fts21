class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, unique: true
      t.text :description
      t.integer :suppervisor_id
      t.integer :status, null: false, default: 0
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
