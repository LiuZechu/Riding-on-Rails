class AddIsCompletedToTasks < ActiveRecord::Migration[5.2]
  def up
  	add_column :tasks, :is_completed, :boolean
  end

  def down
  	remove_column :tasks, :is_completed, :boolean
  end
end
