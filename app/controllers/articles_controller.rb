class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
  end


  private

  def article_params
    params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
