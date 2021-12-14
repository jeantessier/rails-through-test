class Manager < ApplicationRecord
  belongs_to :director

  has_one :ceo, through: :director
  has_many :workers
end
