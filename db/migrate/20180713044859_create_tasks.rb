class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    	t.string "description"
    	t.string "address"
    	t.references "user"
    end
  end
end
