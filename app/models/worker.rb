class Worker < ApplicationRecord
  belongs_to :manager

  has_one :director, through: :manager
  has_one :ceo, through: :director

  def cost
    hours * rate
  end
end
