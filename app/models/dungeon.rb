class Dungeon < ApplicationRecord
  has_many :games

  validates :name, presence: true
  validates :level, numericality: {
    greater_than_or_equal_to: 1
  }

  validates :depth, numericality: {
    greater_than_or_equal_to: 1
  }

end
