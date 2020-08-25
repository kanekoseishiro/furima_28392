require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品が出品できる' do
    it "出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が存在する" do
      expect(@item).to be_valid
    end
    it "販売価格が300~9999999である" do
      @item.price = 10000
      expect(@item).to be_valid
    end
    it "カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数が「---」以外である" do
      @item.category_id = 5
      @item.product_status_id = 5
      @item.shipping_area_id = 5
      @item.date_of_shipment_id = 5
      @item.delivery_fee_id = 5
      expect(@item).to be_valid
    end
  end

  describe '商品が出品できない' do
    it "出品画像が空だと出品できない" do
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "出品名が空だと出品できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "出品商品の説明が空だと出品できない" do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "カテゴリーが「---」では出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態が「---」では出品できない" do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status must be other than 1")
    end
    it "配送料に負担が「---」では出品できない" do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end
    it "発送元の地域が「---」では出品できない" do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end
    it "発送までの日数が「---」では出品できない" do
      @item.date_of_shipment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Date of shipment must be other than 1")
    end
    it "販売価格が空だと出品できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "販売価格が¥300以下では出品できない" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    it "販売価格が¥9999999以上では出品できない" do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
  end
end
