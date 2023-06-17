class LikesController < ApplicationController
    def create
        @user_post = Post.find(params[:id])
        @like = Like.new(author: current_user, post: @user_post)
      if @like.save
        flash[:success] = "Gave a like to post!"
      else
        flash[:error] = 'Adding a like failed!'
      end
      redirect_to user_post_path(@user_post.author, @user_post)
    end
  end