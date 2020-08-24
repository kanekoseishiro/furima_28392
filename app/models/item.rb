class Item < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :purchase

  with_options presence: true do
    validates :name
    validates :price, numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
    validates :explanation
    validates :category_id
    validates :product_status_id
    validates :shipping_area_id
    validates :date_of_shipment_id
    validates :delivery_fee_id
  end
end
