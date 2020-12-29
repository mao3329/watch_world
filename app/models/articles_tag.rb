class ArticlesTag

  include ActiveModel::Model
  attr_accessor :title, :text, :image, :name

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :name
  end

  def save
    tweet = Tweet.create(title: title, text: text, image: image)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    ArticleTag.create(article_id: article.id, tag_id: tag.id)
  end
end