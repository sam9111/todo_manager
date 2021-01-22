# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  end
