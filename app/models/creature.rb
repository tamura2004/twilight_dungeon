class Creature < ApplicationRecord

  scope :lived, -> {where("hp > 0")}
  scope :dead, -> {where(hp: 0)}

  def damaged(damage)
    if hp < damage
      update(hp:0)
    else
      update(hp:hp - damage)
    end
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