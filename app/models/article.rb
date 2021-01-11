class Article < ApplicationRecord
  belongs_to :user
  has_many :comments,          dependent: :destroy
  has_many :article_tags,      dependent: :destroy
  has_many :tags,              through: :article_tags
  has_many :favorite_articles, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  def Article.search(search)
    Article.where(['title LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%"])
  end
end
