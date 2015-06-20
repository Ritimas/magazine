class User < ActiveRecord::Base
  has_many :articles
  has_many :comments
  
  include EditableByAuthor
  
  def user_id
    id
  end
  
  def self.authenticate(email, password)
    User.find_by(email: email, password: password)
  end
end
