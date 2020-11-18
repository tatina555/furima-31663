require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複した場合登録できない' do
      @user.save
      another_users = FactoryBot.build(:user)
      another_users.email = @user.email
      another_users.valid?
      expect(another_users.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力が必須であること数字のみ' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは、半角英数字混合での入力が必須であること英語のみ' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = '111aaa'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = '111aaa'
      @user.password_confirmation = '222bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザーラストネームは、名字と名前がそれぞれ必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'ユーザーファーストネームは、名字と名前がそれぞれ必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'ユーザーラストネームは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'a＠'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'ユーザーファーストネームは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'a＠'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'ユーザーラストネームのフリガナは、名字と名前でそれぞれ必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'ユーザーファーストネームのフリガナは、名字と名前でそれぞれ必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'ユーザーラストネームのフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = '漢字ひらがなhankaku'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = '漢字ひらがなhankaku'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end

  # 正常系

  context '正常系' do
    it '全ての条件を満たす時' do
      expect(@user).to be_valid
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aaa@aaa'
      expect(@user).to be_valid
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.nickname = '111aaaaaaaaaaa'
      expect(@user).to be_valid
    end

    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = '111aaa'
      @user.password_confirmation = '111aaa'
      expect(@user).to be_valid
    end

    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = '111aaa'
      @user.password_confirmation = '111aaa'
      expect(@user).to be_valid
    end
  end
end
