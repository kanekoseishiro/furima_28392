require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    @purchase_address = FactoryBot.build(:purchase_address, item_id: item.id, user_id: buyer.id)
  end

  describe '購入できる' do
    it "トークン、郵便番号、都道府県、市区町村、番地、電話番号が存在する" do
      expect(@purchase_address).to be_valid
    end
    it "電話番号は11文字以下である" do
      @purchase_address.phone_number = "11111111111"
      expect(@purchase_address).to be_valid
    end
  end

  describe '購入できない' do
    it "トークンが存在しない" do
      @purchase_address.token = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が存在しない" do
      @purchase_address.postal_code = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it "郵便番号に「-」が存在しない" do
      @purchase_address.postal_code = "1111111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end
    it "郵便番号が数字以外で存在する" do
      @purchase_address.postal_code = "aaa-aaaa"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end
    it "郵便番号が「3文字」「-」「4文字」以外で存在する" do
      @purchase_address.postal_code = "11111-11"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end
    it "都道府県が存在しない" do
      @purchase_address.prefecture = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "都道府県が「---」で存在する" do
      @purchase_address.prefecture = "1"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "市区町村が存在しない" do
      @purchase_address.city = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it "番地が存在しない" do
      @purchase_address.house_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it "電話番号が存在しない" do
      @purchase_address.phone_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が11文字以上で存在する" do
      @purchase_address.phone_number = "000011110000"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
