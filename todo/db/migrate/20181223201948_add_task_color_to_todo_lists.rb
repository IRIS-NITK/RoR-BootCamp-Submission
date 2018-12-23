class AddTaskColorToTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :task_color, :text
  end
end
