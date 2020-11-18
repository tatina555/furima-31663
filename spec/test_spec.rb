require 'rails_helper'

describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが重複した場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      #binding.pry
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは、@を含む必要があること" do
      another_users = FactoryBot.build(:user)
      another_users.email =  "aaaaaaaa"
      another_users.valid?
      #binding.pry
      expect(another_users.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      password_users = FactoryBot.build(:user)
      password_users.password = "11111"
      password_users.valid?
      #binding.pry
      expect(password_users.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは、半角英数字混合での入力が必須であること" do
      password_users_math = FactoryBot.build(:user)
      password_users_math.password = "111111"
      password_users_math.valid?
      #binding.pry
      expect(password_users_math.errors.full_messages).to include("Password is invalid")
    end

    it "パスワードは、確認用を含めて2回入力すること" do
      password_users_maths = FactoryBot.build(:user)
      password_users_maths.password = "111aaa"
      password_users_maths.password_confirmation = ""
      password_users_maths.valid?
      #binding.pry
      expect(password_users_maths.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
     password_users_mathss = FactoryBot.build(:user)
     password_users_mathss.password = "111aaa"
     password_users_mathss.password_confirmation = "222bbb"
     password_users_mathss.valid?
     #binding.pry
     expect(password_users_mathss.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.last_name = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.first_name = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = "a＠"
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "a＠"
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.last_name_kana = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.first_name_kana = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana = "漢字ひらがなhankaku"
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = "漢字ひらがなhankaku"
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end

