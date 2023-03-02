class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :description, length: { maximum: 600 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
