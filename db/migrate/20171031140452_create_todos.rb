class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.date :due_date
      t.text :desc  
      t.timestamps
      t.boolean :finished, :default => false
    end
  end
end
