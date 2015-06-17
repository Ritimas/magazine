class User < ActiveRecord::Base
  has_many :articles
  has_many :comments
  
  def self.authenticate(email, password)
    User.find_by(email: email, password: password)
  end
end
