class CommentsController < ApplicationController
  def create
    @comment = article.comments.create(comment_params)
    redirect_to @comment.article
  end
  
  private
  def article
    Article.find(params['article_id'])
  end
  
  def comment_params
    params.require(:comment).permit(:body, :user_id, :comment_id)
  end
end
