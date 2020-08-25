class Item < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :date_of_shipment
  belongs_to_active_hash :delivery_fee

  with_options presence: true do
    validates :image
    validates :name
    validates :price, numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :product_status_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :date_of_shipment_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
  end
end
