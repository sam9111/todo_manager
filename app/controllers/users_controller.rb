# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
    render "index"
  end

  def show
    render plain: Users.find(params[:id]).to_pleasant_string
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    user = User.new(first_name: first_name, last_name: last_name, email: email, password: password)
    if user.save
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = user.errors.full_messages.join("! ")
      redirect_to new_user_path
    end
  end

  def login
    user = Users.find_by_email(params[:email])
    if params[:password] == user.password
      render plain: "True"
    else
      render plain: "False"
    end
  end
end
