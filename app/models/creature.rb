class Creature < ApplicationRecord

  def attack(creature,d20: nil)
    d20 ||= rand(20) + 1
    case d20
    when 1
    when 20
      creature.update(hp:0)
    else
    end
    return d20
  end

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

  scope :lived, -> {where("hp > 0")}
  scope :dead, -> {where(hp: 0)}

end