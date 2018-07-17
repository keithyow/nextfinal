class AddLocationToTasks < ActiveRecord::Migration[5.2]
  def change
  	add_column :tasks, :address, :string
  end
end
