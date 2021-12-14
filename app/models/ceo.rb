class Ceo < ApplicationRecord
  has_many :directors
  has_many :managers, through: :directors
  has_many :workers, through: :managers
end
