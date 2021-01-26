# todos_controller.rb
class TodosController < ApplicationController
  def index
    #render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
    @todos = Todo.of_user(current_user)
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    response_text = "Hey,your new todo is created with the id #{new_todo.id}!"
    redirect_to todos_path
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
