class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email,           presence: true, uniqueness: true
         validates :password,        format: { with: /[a-z\d]{6,}/i, message: "is invalid. Include both letters and numbers" }
         validates :nickname,        presence: true, uniqueness: true
         validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
         validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
         validates :first_name_kana, presence: true, format: { with: /\p{katakana}/, message: 'is invalid. Input full-width katakana characters' }
         validates :last_name_kana,  presence: true, format: { with: /\p{katakana}/, message: 'is invalid. Input full-width katakana characters' }
         validates :birthdate,       presence: true
end
