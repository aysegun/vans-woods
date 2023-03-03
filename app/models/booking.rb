class Booking < ApplicationRecord
  belongs_to :van
  belongs_to :user
  enum status: %i[pending approved rejected]
end
