class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :listings, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :rentals_as_owner, through: :listings, source: :rentals
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
