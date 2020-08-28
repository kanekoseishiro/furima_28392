class Transaction < ApplicationRecord
  berongs_to :user
  berongs_to :item

  validates :price, presence: true
end
