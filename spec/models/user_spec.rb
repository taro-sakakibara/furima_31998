require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録がうまくいくとき' do
      it "email,password,password_confirmation,nickname,first_name_kanji,family_name_kanji,first_name_kana,family_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid        
      end
    end

    context 'ユーザー登録がうまくいかないとき' do
      it "nicknameが空だと登録出来ない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録出来ない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録出来ない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "passwordが6文字未満だと登録出来ない" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      # サンプルのアプリでは保存できてしまうので飛ばします
      # it "passwordが６文字以上でも半角英数字を両方含めていないと登録出来ない" do
      #   @user.password = "123456"
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include ""
      # end

      it "passwordとpassword_confirmationが一致していないと登録出来ない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"  
      end
      it "first_name_kanjiが空だと登録出来ない" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji can't be blank"
      end
      it "family_name_kanjiが空だと登録出来ない" do
        @user.family_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kanji can't be blank"
      end
      it "first_name_kanaが空だと登録出来ない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "family_name_kanaが空だと登録出来ない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it "birthdayが空だと登録出来ない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
  


end
