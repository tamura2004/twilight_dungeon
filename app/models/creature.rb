class Creature < ApplicationRecord
  belongs_to :game

  validates :name, presence: true
  validates :skill, presence: true
  validates :level, numericality: {greater_than_or_equal_to: 0}
  validates :hp, numericality: {greater_than_or_equal_to: 0}
  validates :at, numericality: {greater_than_or_equal_to: 0}
  validates :df, numericality: {greater_than_or_equal_to: 0}
  validates :exp, numericality: {greater_than_or_equal_to: 0}

  delegate :log, to: :game

  scope :lived, -> {where("hp > 0")}
  scope :dead, -> {where(hp: 0)}

  def take_damage(damage)
    if hp < damage
      die!
    else
      update(hp:hp - damage)
    end
    log "#{name}に#{damage}ダメージ"
  end

  def die!
    update(hp:0)
  end

  def lived?
    hp > 0
  end

  def dead?
    hp == 0
  end

  def to_s
    name
  end

end