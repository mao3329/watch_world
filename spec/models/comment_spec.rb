require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "コメントの投稿" do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context "コメントが投稿できる" do
      it "全ての値が存在すれば登録できる" do
        expect(@comment).to be_valid
      end
    end

    context "コメントが投稿できない" do
      it "textが空では登録できない" do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it "articleが存在しなければ登録できない" do
        @comment.article = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Article must exist")
      end
      
      it "" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
    end
  end
end
