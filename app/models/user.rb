class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*\d)(?=.*[a-zA-Z])/ }
  validates :password_confirmation, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :name_in_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_in_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :date_of_birth, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  # validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze}


  has_many :items
  has_many :purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
