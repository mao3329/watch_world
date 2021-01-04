class FavoriteArticlesController < ApplicationController
  before_action :set_article
  before_action :authenticate_user!

  def create
    if @article.user_id != current_user.id
      @favorite_article = FavoriteArticle.create(user_id: current_user.id, article_id: @article.id)
    end
  end

  def destroy
    @favorite_article = FavoriteArticle.find_by(user_id: current_user.id, article_id: @article.id)
    @favorite_article.destroy
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
