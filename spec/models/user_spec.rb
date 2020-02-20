require 'rails_helper'

describe User do
  describe '#create' do
    
    it "is valid with a user registration" do #新規登録
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nick_name" do #ニックネームが必須
      user = build(:user, nick_name: "")
      user.valid?
      expect(user.errors[:nick_name]).to include("を入力してください")
    end

    it "is invalid without an email" do #メールアドレスが必須
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください") 
    end

    it "is invalid with a duplicate email address" do #メールアドレスが一意である
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid without an password" do #パスワードが必須
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is valid with a password that has more than 7 characters " do #パスワード７文字以上
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "is valid with a password that has less than 6 characters" do #パスワード6文字以下
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "is valid without password_confirmation and don't match password" do #パスワードの確認の必須とパスワードとマッチ
      user = build(:user, password: "0000000", password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "is invalid without a family-name, name" do #本名が必須
      user = build(:user, family_name: "", name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a family-name, name" do #本名ふりがなが必須
      user = build(:user, family_name_furigana: "", name_furigana: "")
      user.valid?
      expect(user.errors[:family_name_furigana]).to include("を入力してください")
      expect(user.errors[:name_furigana]).to include("を入力してください")
    end


  end

end