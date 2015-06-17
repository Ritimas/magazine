class CommentsController < ApplicationController
  def create
    @comment = article.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @comment.article
  end
  
  private
  def article
    Article.find(params['article_id'])
  end
  
  def comment_params
    params.require(:comment).permit(:body, :comment_id)
  end
end
