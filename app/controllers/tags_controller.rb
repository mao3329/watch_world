class TagsController < ApplicationController

  def index
    @tags = Tag.order(:name)
  end

  def show
    @tag = Tag.find(params[:id])
    @articles = @tag.articles.all.includes(:user)
    @tags = Tag.joins(:article_tags).group(:tag_id).order('count(article_id)desc').includes(:articles)
  end
end
