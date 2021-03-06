class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :surfboards, dependent: :destroy, inverse_of: 'owner'
  has_many :bookings, dependent: :destroy, inverse_of: 'client'
  has_one_attached :profile_pic
end
