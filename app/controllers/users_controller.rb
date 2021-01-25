# users_controller.rb
class UsersController < ApplicationController
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
    User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    redirect_to root_path
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
