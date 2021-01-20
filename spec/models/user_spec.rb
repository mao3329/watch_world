require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できる時" do
      it "情報が全て正しく存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できない時" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "同じnicknameがすでに登録されていたら登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.email = "test@yahoo"
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Nickname has already been taken")
      end
  
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it "同じemailがすでに登録されていたら登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = "tester"
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
  
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it "passwordに数字が含まれていない場合登録できない" do
        @user.password = "testaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
  
      it "passwordにローマ字が含まれていない場合登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
  
      it "passwordが６文字未満だと登録できない" do
        @user.password = "test0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end
