class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :description, length: { maximum: 600 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_model,
    against: [ :title, :model, :description],
    using: {
      tsearch: { prefix: true }
  }
end
