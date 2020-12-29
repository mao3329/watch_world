class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to article_path(@comment.article_id)
    else
      @article = @comment.article
      @comments = @article.comments
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
