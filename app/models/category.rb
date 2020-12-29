class Category < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Music' },
    { id: 3, name: 'MAG' },
    { id: 4, name: 'Sports' },
    { id: 5, name: 'Science' },
    { id: 6, name: 'Other' }
  ]

  include ActiveHash::Associations
  has_many :articles
end
