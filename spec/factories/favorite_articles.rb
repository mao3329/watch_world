FactoryBot.define do
  factory :favorite_article do
    association :user
    association :article
  end
end
