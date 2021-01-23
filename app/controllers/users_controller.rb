# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Users.order(:created_at).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    render plain: Users.find(params[:id]).to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    Users.create!(name: name, email: email, password: password)
    render plain: "User with name '#{name}' was successfully created"
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
