class Rental < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  enum status: { pending: 0, approved: 1, rejected: 2 }
end
