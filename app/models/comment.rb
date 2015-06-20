class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  
  # Comment on comment
  has_many :comments
  belongs_to :comment
  
  include EditableByAuthor
  
  def editable_by?(user)
    super(user) and not comments.any?
  end
end
