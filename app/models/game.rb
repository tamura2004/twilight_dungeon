class Game < ApplicationRecord
  belongs_to :dungeon
  has_many :monsters
  has_many :players

  validates :depth, numericality: {greater_than_or_equal_to: 1}
  validates :score, numericality: {greater_than_or_equal_to: 1}
  validate :too_deep

  delegate :log, to: :@notebook

  def too_deep
    errors.add(:depth,:too_deep) if depth > dungeon.depth
  end

  after_initialize do
    @notebook = Tool::Notebook.new
  end

end
