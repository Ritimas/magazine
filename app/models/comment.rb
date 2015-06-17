class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  
  # Comment on comments
  has_many :comments
  belongs_to :comment
end
