class Player < Creature
  belongs_to :game
  has_many :items

  validates :name, presence: true
  validates :skill, presence: true

  validates :level, numericality: {greater_than_or_equal_to: 0}
  validates :hp, numericality: {greater_than_or_equal_to: 0}
  validates :at, numericality: {greater_than_or_equal_to: 0}
  validates :df, numericality: {greater_than_or_equal_to: 0}
  validates :exp, numericality: {greater_than_or_equal_to: 0}

end
