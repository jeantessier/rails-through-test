class Director < ApplicationRecord
  belongs_to :ceo

  has_many :managers, dependent: :destroy
  has_many :workers, through: :managers

  def cost
    managers.collect(&:cost).sum
  end
end
