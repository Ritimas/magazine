class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  
  # Comment on comment
  has_many :comments
  belongs_to :comment
end
