class User < ApplicationRecord
  has_secure_password
  has_many :todos

  def to_pleasant_string
    "User #{id}: #{name} #{email} #{password}"
  end
end
