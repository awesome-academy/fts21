class CreateUserSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_subjects do |t|
      t.references :user, foreign_key: true
      t.references :course_subject, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
