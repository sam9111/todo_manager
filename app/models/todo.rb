class Todo < ActiveRecord::Base
  belongs_to :user

  def due_today?
    due_date == Date.today
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def overdue_completed?
    due_date < Date.today and completed
  end

  def to_pleasant_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_pleasant_string }
  end

  def self.overdue
    all.where("due_date < ?", Date.today)
  end
  def self.due_today
    all.where("due_date = ?", Date.today)
  end
  def self.due_later
    all.where("due_date > ?", Date.today)
  end
  def self.completed
    all.where(completed: true)
  end
  def self.add_task(new_todo)
    todo = Todo.new
    todo.todo_text = new_todo[:todo_text]
    todo.due_date = Date.today + new_todo[:due_in_days]
    todo.completed = false
    todo.save
    todo
  end
end
