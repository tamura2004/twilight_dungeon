class Creature < ApplicationRecord

  def attack(creature,d20)
    case d20
    when 1
    when 20
      creature.update(hp:0)
    else
    end
  end

  def damaged(damage)
    if hp < damage
      update(hp:0)
    else
      update(hp:hp - damage)
    end
  end

  scope :lived, -> {where("hp > 0")}
  scope :dead, -> {where(hp: 0)}

end