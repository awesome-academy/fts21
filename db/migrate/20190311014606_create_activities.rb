class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.string :action_type
      t.references :target, polymorphic: true, index: true

      t.timestamps
    end
  end
end
