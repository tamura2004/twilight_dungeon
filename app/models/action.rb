class Action < ApplicationRecord
  belongs_to :source, class_name: "Creature"
  belongs_to :target, class_name: "Creature"

  def run(d20:nil)
    d20 ||= rand(20)+1

    DungeonMaster.new(self) do |dm|
      dm.perform!
      self.message = dm.message
    end

  end

end

class DungeonMaster
  delegate :perform!, :message, to: :rule_book

  def initialize(action)
    case action.name
    when "攻撃"
      @rule_book = DungeonMastersGuild::Attack.new(action)
    end
  end
end

class DungeonMastersGuild::Attack
  delegate :perform!, :message, to: :rule_book

  def initialize(action)
    case @attacker.type
    when Player
      @rule_book = PlayerHandbook::Attack.new(action)
    when Monster
      @rule_book = MonsterManual::Attack.new(action)
    end
  end
end

class PlayerHandbook::Attack
  attr_reader :message

  def initialize(action)
    @player = action.source
    @monster = action.target
  end

  def log(message)
    @message += message + "\n"
  end

  def attack!
    log "#{@player}は#{@monster}を攻撃。"
    Dice.roll do |d20|

    case Dice.roll
    when :critical then critical_hit!
    when :fumble then fumble!
    else normal_damage(enemy,d20)
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


end
