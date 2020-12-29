class ArticlesTag

  include ActiveModel::Model
  attr_accessor :title, :text, :image, :name, :category_id, :user_id

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :name
  end

  validates :category_id, numericality: { other_than: 1 }

  def save
    article = Article.create(title: title, text: text, image: image, category_id: category_id, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    ArticleTag.create(article_id: article.id, tag_id: tag.id)
  end
end