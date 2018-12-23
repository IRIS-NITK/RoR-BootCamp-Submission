class AddCompletionDateToTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :completion_date, :text
  end
end
