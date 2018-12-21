class AddColorToTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :color, :string
  end
end
