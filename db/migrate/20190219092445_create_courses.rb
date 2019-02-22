class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, unique: true
      t.text :description
      t.integer :suppervisor_id
      t.boolean :status, default: true
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
