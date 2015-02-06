class CommentsController < ApplicationController
  def new #form to make new cmt
    @comment = Comment.new 
  end
 
  def create #restful route to make new cmt!
  	@comment = Comment.new( cmt_params )
    if @comment.save
      sign_in @comment
      flash[:enter_success] = 'Your comment has been submitted.'
      redirect_to '/users/'+cmt_params[:user_id]
    else
      flash[:enter_fail] = @comment.errors.full_comments
      redirect_to '/users/'+cmt_params[:user_id]
    end
  end

  #define strong parameters!
  private
    def cmt_params
      params.require(:comment).permit(:reply, :user_id, :message_id)
    end
end
