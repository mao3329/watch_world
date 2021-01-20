require 'rails_helper'

RSpec.describe ArticlesTag, type: :model do
  describe '記事の投稿' do
    before do
      @articles_tag = FactoryBot.build(:articles_tag)
      @articles_tag.image = fixture_file_upload("/files/test_image.png")
    end

    context "記事が投稿できる" do
      it "全ての値が正しく存在すれば記事を投稿できる" do
        expect(@articles_tag).to be_valid
      end
    end

    context "記事が投稿できない" do
      it "titleが空だと投稿できないこと" do
        @articles_tag.title = ""
        @articles_tag.valid?
        expect(@articles_tag.errors.full_messages).to include("Title can't be blank")
      end

      it "textが空だと投稿できないこと" do
        @articles_tag.text = ""
        @articles_tag.valid?
        expect(@articles_tag.errors.full_messages).to include("Text can't be blank")
      end

      it "imageが空だと投稿できないこと" do
        @articles_tag.image = ""
        @articles_tag.valid?
        expect(@articles_tag.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空だと投稿できないこと" do
        @articles_tag.name = ""
        @articles_tag.valid?
        expect(@articles_tag.errors.full_messages).to include("Name can't be blank")
      end

      it "category_idが1だと投稿できないこと" do
        @articles_tag.category_id = 1
        @articles_tag.valid?
        expect(@articles_tag.errors.full_messages).to include("Category must be other than 1")
      end
    end
  end
end
