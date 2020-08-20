class User < ApplicationRecord
  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :birthday
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
