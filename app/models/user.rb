class User < ApplicationRecord
  has_many :todos
  has_secure_password

  def to_pleasant_string
    "User #{id}: #{name} #{email} #{password}"
  end
end
