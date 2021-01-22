class Users < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{name} #{email}"
  end
end
