require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user,
      nickname: 'testuser',
      email: 'test@example.com',
      password: 'aaa1234',
      password_confirmation: 'aaa1234',
      name: '海保',
      last_name: '徹',
      name_in_katakana: 'カイホ',
      last_name_in_katakana: 'トオル',
      date_of_birth: '2000-01-01')
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmationとnameとlast_nameとname_in_katakanaとlast_name_in_katakanaとdate_of_birthが存在すれば登録できる' do
     expect(@user).to be_valid
    end
   end
   context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが6文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordで半角英字のみでは登録できない' do
      @user.password = 'aaaaaa' 
      @user.password_confirmation = 'aaaaaa' 
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordで半角数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'aaa123あ'
      @user.password_confirmation = 'aaa123あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）入力しないと登録できない' do
      @user.last_name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'nameが全角（漢字・ひらがな・カタカナ）しないと登録できない' do
      @user.name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name is invalid')
    end
    it 'last_name_in_katakanaが空では登録できない' do
      @user.last_name_in_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name in katakana can't be blank")
    end
    it 'last_name_in_katakanaが全角（カタカナ）での入力以外の場合は登録できない' do
      @user.last_name_in_katakana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name in katakana is invalid')
    end
    it 'name_in_katakanaが空では登録できない' do
      @user.name_in_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name in katakana can't be blank")
    end
    it 'name_in_katakanaが全角（カタカナ）での入力以外の場合は登録できない' do
      @user.name_in_katakana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name in katakana is invalid')
    end
    it 'date_of_birthが空では登録できない' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
     end
    end
  end
end
