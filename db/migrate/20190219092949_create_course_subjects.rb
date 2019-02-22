class CreateCourseSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subjects do |t|
      t.references :course, foreign_key: true
      t.references :subject, foreign_key: true
      t.boolean :status, default: true
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
