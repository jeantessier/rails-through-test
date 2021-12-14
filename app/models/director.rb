class Director < ApplicationRecord
  belongs_to :ceo

  has_many :managers
  has_many :workers, through: :managers
end
