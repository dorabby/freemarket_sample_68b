describe Item do
  describe '#create' do

    #nameが空の場合保存できない
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    #nameの文字が40文字以上場合
    it "is invalid name is too long maximum 40 characters" do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    #descriptionがからの場合保存できない
    it "is invalid without a description" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    #descriptionの文字が40文字以上場合
    it "is invalid description is too long maximum 1000 characters" do
      item = build(:item, description: "a" * 1001)
      item.valid?
      expect(item.errors[:description]).to include("は1000文字以内で入力してください")
    end

    #category_idが空の場合保存できない
    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    #priceがからの場合保存できない
    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end


    #priceが300円以下の場合
    it "is invalid with a that has less than 300" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は一覧にありません")
    end

    #priceが9999999円以上の場合
    it "is invalid price is too much maximum 9999999" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は一覧にありません")
    end

    #conditionがからの場合保存できない
    it "is invalid without a condition" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    #derivery_chargeがからの場合保存できない
    it "is invalid without a derivery_charge" do
      item = build(:item, derivery_charge: "")
      item.valid?
      expect(item.errors[:derivery_charge]).to include("を入力してください")
    end

    #daysがからの場合保存できない
    it "is invalid without a days" do
      item = build(:item, days: "")
      item.valid?
      expect(item.errors[:days]).to include("を入力してください")
    end

    #prefecture_idが空の場合保存できない
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

  end
end
