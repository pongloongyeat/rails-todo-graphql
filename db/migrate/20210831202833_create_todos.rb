class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :description
      t.boolean :is_done
      t.datetime :due_date

      t.timestamps
    end
  end
end
