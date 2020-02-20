require 'rails_helper'

describe Address do
  describe '#create' do
    it "is valid with a address registration" do #新規登録
      address = build(:address)
      expect(address).to be_valid
    end

    it "is invalid without a family-name, name" do #本名が必須
      address = build(:address, family_name: "", name: "")
      address.valid?
      expect(address.errors[:family_name]).to include("を入力してください")
      expect(address.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a family-name, name" do #本名ふりがなが必須
      address = build(:address, family_name_furigana: "", name_furigana: "")
      address.valid?
      expect(address.errors[:family_name_furigana]).to include("を入力してください")
      expect(address.errors[:name_furigana]).to include("を入力してください")
    end

    it "is invalid without a potalcode" do #郵便番号が必須
      address = build(:address, potalcode: nil)
      address.valid?
      expect(address.errors[:potalcode]).to include("を入力してください")
    end

    it "is invalid without a prefecture" do #都道府県が必須
      address = build(:address, prefectures: "" )
      address.valid?
      expect(address.errors[:prefectures]).to include("を入力してください")
    end

    it "is invalid without a municipalities" do #市町村区が必須
      address = build(:address, municipalities: "")
      address.valid?
      expect(address.errors[:municipalities]).to include("を入力してください")
    end

    it "is invalid without a address" do #市町村区が必須
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end

    it "is valid with a address registration" do #電話番号が任意
      address = build(:address, tel: "")
      expect(address).to be_valid
    end

  end
end