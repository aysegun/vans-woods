class Booking < ApplicationRecord
  belongs_to :van
  belongs_to :user

  validates :van_id, uniqueness: { scope: :user_id }
end
