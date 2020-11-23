class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :family_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ン]/, message: 'Full-width katakana characters' }
    validates :family_name_kana, format: { with: /\A[ァ-ン]/, message: 'Full-width katakana characters' }
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
end
