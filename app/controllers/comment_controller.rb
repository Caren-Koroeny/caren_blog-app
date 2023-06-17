class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create_comment
    @user_post = Post.find(params[:id])
    @comment = @user_post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(user_id: @user_post.author_id, id: @user_post.id),
                  notice: 'Comment created successfully.'
    else
      redirect_to user_post_path(user_id: @user_post.user.id, id: @user_post.id),
                  alert: 'Failed to create comment.'
    end
  end
end
