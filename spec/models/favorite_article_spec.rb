require 'rails_helper'

RSpec.describe FavoriteArticle, type: :model do
  describe "記事お気に入り" do
    before do
      @favorite_article = FactoryBot.build(:favorite_article)
    end

    context "記事のお気に入りができる" do
      it "ユーザーとユーザーと記事が存在すればお気に入りできる" do
        expect(@favorite_article).to be_valid
      end
    end

    context "記事のお気に入りができない" do
      it "ユーザーが存在しなければお気に入りできない" do
        @favorite_article.user = nil
        @favorite_article.valid?
        expect(@favorite_article.errors.full_messages).to include("User must exist")
      end
      
      it "記事が存在しなければお気に入り登録できない" do
        @favorite_article.article = nil
        @favorite_article.valid?
        expect(@favorite_article.errors.full_messages).to include("Article must exist")
      end
    end
  end
end
