class CreateUserTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tasks do |t|
      t.references :task, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 1
      t.datetime :receive_at
      t.datetime :finish_at

      t.timestamps
    end
  end
end
