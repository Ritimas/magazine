module EditableByAuthor
  extend ActiveSupport::Concern
  
  def editable_by?(user)
    user_id == user.id
  end
end