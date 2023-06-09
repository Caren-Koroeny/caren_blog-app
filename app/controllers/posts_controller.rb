class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts.includes(:comments).order(created_at: :desc)
    @recent_comments = @user_posts.flat_map(&:recent_five_comments)
  end

  def show
    @user = User.find(params[:user_id])
    @user_post = @user.posts.find(params[:id])
    @post_index = @user.posts.order(created_at: :desc).pluck(:id).index(@user_post.id) + 1
    @likes_count = @user_post.likes_counter
    @comments_count = @user_post.comments_counter
    @comment = Comment.new
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = 'New post uploaded successfully!'
      redirect_to user_post_url(current_user, @post)
    else
      flash[:error] = 'Post upload failed! Please try again.'
      redirect_to new_user_post_url(current_user)
    end
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

  def like
    @user_post = Post.find(params[:id])
    @like = Like.new(author: current_user, post: @user_post)

    if @like.save
      flash[:success] = 'Gave a like to this post!'
    else
      flash[:error] = 'Adding a like failed!'
    end

    redirect_to user_post_path(@user_post.author, @user_post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:post_id, :text)
  end
end
