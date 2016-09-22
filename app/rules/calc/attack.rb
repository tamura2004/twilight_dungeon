class Calc::Attack
  delegate :at, :level, to: :attacker
  delegate :df, to: :defender

  def initialize
    yield self if block_given?
  end

  def deal_damage(attacker)
    attacker.at * (Dice.roll + 40) / 50
  end

  def take_damage(defender,damage)
    # 全ダメージの5%を貫通ダメージとして保証
    dmg = [damage - defender.df, damage / 20].max
    defender.take_damage(dmg)
  end
end
