class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presences: true do
    validates :title
    validates :text
    validates :image
  end
end
