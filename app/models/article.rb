class Article < ApplicationRecord
  belongs_to :user
  has_many :comments,          dependent: :destroy
  has_many :article_tags,      dependent: :destroy
  has_many :tags,              through: :article_tags
  has_many :favorite_articles, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  private

  def Article.search(search)
    Article.where(['title LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%"])
  end

  def Article.category_search(category_id)
    Article.where(category_id: category_id).includes(:user)
  end

  def Article.sort_by_newest
    Article.all.order(Arel.sql('created_at DESC')).includes(:user)
  end

  def Article.sort_by_favorites
    Article.joins(:favorite_articles).group(:article_id).order(Arel.sql('count(favorite_articles.user_id)desc')).includes(:user)
  end
end
