class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content
      t.datetime :due_date
      t.references :user, foreign_key: true
      t.string :tag
      t.string :priority_level

      t.timestamps
    end
  end
end
