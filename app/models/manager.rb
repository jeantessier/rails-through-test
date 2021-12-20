class Manager < ApplicationRecord
  belongs_to :director

  has_one :ceo, through: :director
  has_many :workers, dependent: :destroy

  def cost
    workers.collect(&:cost).sum
  end
end
