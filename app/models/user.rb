class User < ApplicationRecord
  has_secure_password
  has_many :todos
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 5 }
  validates :first_name, presence: true

  def to_pleasant_string
    "User #{id}: #{name} #{email} #{password}"
  end
end
