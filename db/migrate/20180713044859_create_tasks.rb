class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    	t.string "image"
    	t.integer "status", default: 0
    	t.references "list"
    end
  end
end
