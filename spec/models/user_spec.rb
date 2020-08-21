require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録がうまくいく' do
    it "ニックネーム、メールアドレス、パスワード、パスワード確認、全角名前、カナ名前、誕生日がある" do
      expect(@user).to be_valid
    end
    it "ニックネームが40文字以下である" do
      @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      expect(@user).to be_valid
    end
    it "パスワードは6文字以上で半角英数字混合であること" do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa111"
      expect(@user).to be_valid
    end
  end

  describe 'ユーザー新規登録がうまくいかない' do
    it "ニックネームが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "ニックネームが41文字以上だと登録できない" do
      @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
    end
    it "メールアドレスが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したメールアドレスが存在する場合は登録できない" do
      @user.save
      anothor_user =FactoryBot.build(:user)
      anothor_user.email = @user.email
      anothor_user.valid?
      expect(anothor_user.errors.full_messages).to include("Email has already been taken")
    end
    it "パスワードが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが5文字以下だと登録できない" do
      @user.password = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードが英数混合でないと登録できない" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが存在してもパスワード確認用が空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "全角名字が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "全角名字は漢字・ひらがな・カタカナのみでないと登録できない" do
      @user.first_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "全角名前が空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "全角名前は漢字・ひらがな・カタカナのみでないと登録できない" do
      @user.last_name = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "カナ名字が空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "カナ名字はカタカナのみでないと登録できない" do
      @user.first_name_kana = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "カナ名前が空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "カナ名前はカタカナのみでないと登録できない" do
      @user.last_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "誕生日が空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
