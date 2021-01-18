class ArticlesTag

  include ActiveModel::Model
  attr_accessor :title, :text, :image, :name, :category_id, :user_id

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :category_id, numericality: { other_than: 1 }
    validates :name
  end

  def save
    article = Article.create(title: title, text: text, image: image, category_id: category_id, user_id: user_id)
    tag = Tag.find_or_create_by(name: name)

    ArticleTag.create(article_id: article.id, tag_id: tag.id)
  end
end