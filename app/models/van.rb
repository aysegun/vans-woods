class Van < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :description, length: { maximum: 600 }
end
