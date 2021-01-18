class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :article_find, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category_id].present?
      @articles = Article.where(category_id: params[:category_id]).includes(:user)
    elsif params[:option] == "B"
      @articles = Article.all.order('created_at DESC').includes(:user)
    elsif params[:option] == "A"
      @articles = Article.joins(:favorite_articles).group(:article_id).order('count(favorite_articles.user_id)desc').includes(:user)
    else
      @articles = Article.all.includes(:user)
    end
    @tags = Tag.joins(:article_tags).group(:tag_id).order('count(article_id)desc').includes(:articles)
  end

  def show
    @comments = @article.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @article = ArticlesTag.new
  end

  def create
    @article = ArticlesTag.new(article_params)
    if @article.valid?
      @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if current_user.id != @article.user_id
      redirect_to root_path
    end
  end

  def update
    if @article.update(update_article_params)
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @articles = Article.search(params[:search])
    render 'index'
  end

  private

  def article_params
    params.permit(:title, :text, :image, :name, :category_id).merge(user_id: current_user.id)
  end

  def update_article_params
    params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
