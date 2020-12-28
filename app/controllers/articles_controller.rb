class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :article_find, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Articles.all
  end

  def show
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

  def edit
    if current_user.id != @article.user_id
      redirect_to root_path
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id)
    else
      render :edit
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    else
      render :show
  end
  private

  def article_params
    params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
