class User < ApplicationRecord
  with_options presence: true do
    character = "/\A[ぁ-んァ-ン一-龥]/"
    kana = "/\A[ァ-ン]/"
    validates :first_name, format: { with: character}
    validates :last_name, format: { with: character}
    validates :first_name_kana, format: { with: kana}
    validates :last_name_kana, format: { with: kana}
    validates :birthday
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
