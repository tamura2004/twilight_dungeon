class DungeonMastersGuild::Attack
  delegate :get_exp, :levelup, to: :attacker
  delegate :dead?, :die!, to: :defender
  delegate :log, to: :action

  def initialize(action)
    @attacker = action.source
    @defender = action.target
    @action = action
  end

  def run!
    log "#{@attacker}は#{@defender}を攻撃。"
    if dead?
      log "#{@defender}は既に死んでいる。"
    else
      attack!
      if dead? && @attacker.is_a? Player
        get_exp(@defender,@logger)
        levelup!
      end
    end
  end

  def attack!
    Dice.roll do |d20|
      case d20
      when 20 then critical_hit!
      when 1 then fumble!
      else normal_hit!(d20)
      end
    end
  end

  def normal_hit!(d20)
    Calc::Attack.new do |calc|
      damage = calc.deal_damage(@attacker)
      calc.take_damage(@defender,damage)
    end
  end

  def critical_hit!
    log "クリティカルヒット！"
    die!
  end

  def fumble!
    log "ファンブル！"
  end
end
