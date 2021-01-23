class Users < ActiveRecord::Base
  def to_pleasant_string
    "User #{id}: #{name} #{email} #{password}"
  end
end
