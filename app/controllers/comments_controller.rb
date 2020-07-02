class CommentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post_id = params[:id]
    @list_post_comments = Comment.create_desc.list_post_comments params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post_id = comment_params[:post_id]
    @comment = current_user.comments.build comment_params
    respond_to do |format|
      format.html
      if @comment.save
        Notifications::CommentReplyService.new(@comment).perform
        @list_post_comments = Comment.create_desc.list_post_comments @post_id
        format.js{flash[:success] = t "flash.success.comment_created"}
      else
        @list_post_comments = Comment.create_desc.list_post_comments @post_id
        format.js{flash[:danger] = t "flash.danger.create_comment_fail"}
      end
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    @post_id = @comment.post_id
    respond_to do |format|
      format.html
      if @comment.destroy
        @list_post_comments = Comment.create_desc.list_post_comments @post_id
        format.js{flash[:success] = t "flash.success.comment_deleted"}
      else
        @list_post_comments = Comment.create_desc.list_post_comments @post_id
        format.js{flash[:danger] = t "flash.danger.delete_comment_fail"}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end
end
