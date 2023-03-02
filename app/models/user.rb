class User < ApplicationRecord
  has_many :vans, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :received_bookings, through: :vans, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
