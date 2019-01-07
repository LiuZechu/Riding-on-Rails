class AddDefaultToIsCompletedInTasks < ActiveRecord::Migration[5.2]
  def change
  	change_column :tasks, :is_completed, :boolean, :default => true
  end
end
