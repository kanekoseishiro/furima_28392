class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :address

  with_options presence: true do
    validates :
    validates :
    validates :
    validates :
    validates :
    validates :
  end
end
