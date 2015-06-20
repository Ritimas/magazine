class CommentsController < ApplicationController
  def create
    @comment = article.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @comment.article, notice: 'Comment was successfully added'
    else
      redirect_to @comment.article, notice: "Some error occured while adding the comment: #{comment.body}"
    end
  end
  
  def destroy
    @comment = article.comments.find(params['id'])

    if @comment.editable_by?(current_user)
      @comment.destroy
      
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Unable to delete comment' }
        format.json { head :no_content }
      end
    end
  end
  
  private
  def article
    Article.find(params['article_id'])
  end
  
  def comment_params
    params.require(:comment).permit(:body, :comment_id)
  end
end
