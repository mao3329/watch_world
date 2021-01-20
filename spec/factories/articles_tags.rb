FactoryBot.define do
  factory :articles_tag do
    title {"Test"}
    category_id { 2 }
    text {"testの文章です"}
    name { "test" }
  end
end
