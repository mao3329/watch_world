class ArticlesTag

  include ActiveModel::Model
  attr_accessor :title, :text, :image, :name, :user_id

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :name
  end

  def save
    article = Article.create(title: title, text: text, image: image, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    ArticleTag.create(article_id: article.id, tag_id: tag.id)
  end
end