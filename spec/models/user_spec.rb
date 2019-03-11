require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation （ユーザー情報全て存在すれば登録できること）" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid wiithout a nickname (ニックネームが空では登録できないこと)" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without email (メアドが空では登録できないこと)" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password （パスワードが空では登録できないこと）" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation although with a password （パスワードがあってもパスワード確認欄が空では登録できないこと））" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "is invalid with a duplicate email address （重複したメアドが存在する場合登録できないこと）" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid with a nickname that has more than 21 characters （ニックネームが２１文字以上では登録できないこと）" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("は20文字以内で入力してください")
    end

    it "is valid with a nickname that has less than 20 characters （ニックネームが２０文字以下であれば登録できること）" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters （パスワードが5文字以下では登録できないこと）" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end

  end
end
