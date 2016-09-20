class Creature < ApplicationRecord

  def attack(enemy,d20)
    "#{name}は#{enemy.name}を攻撃。d20->#{d20}\n" +
    case d20
    when 20 then critical(enemy)
    when 1 then fumble(enemy)
    else normal_attack(enemy,d20)
    end
  end

  def normal_attack(enemy,d20)
    damage = (at*d20/10 - enemy.df)
    damage = d20 if damage.zero?
    enemy.damaged(damage)
    "#{enemy.name}に#{damage}ダメージ。\n"
  end

  def critical(enemy)
    enemy.update(hp:0)
    "クリティカルヒット！\n"
  end

  def fumble(enemy)
    "ファンブル！\n"
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