class Action < ApplicationRecord
  belongs_to :source, class_name: "Creature"
  belongs_to :target, class_name: "Creature"

  def run(d20:nil)
    d20 ||= rand(20)+1

    case name
    when "攻撃"
      self.message = "#{source.name}の攻撃。\n"
      attack(d20)
    else
    end
  end

  private

    def attack(d20)
      case source
      when Player then player_attack(d20)
      when Monster then monster_attack(d20)
      else
      end
    end

    def player_attack(d20)
      case d20
      when 20
        self.message += "クリティカルヒット！\n"
        self.message += "#{target.name}を倒した\n"
        target.update(hp:0)
      when 1
        self.message += "ファンブル！\n"
        self.message += "#{target.name}は笑った\n"
      else
      end
    end

    def monster_attack(d20)
      case d20
      when 20
        self.message += "痛恨の一撃！\n"
        self.message += "#{target.name}は死んでしまった！\n"
        target.update(hp:0)
      when 1
        self.message += "#{target.name}はひらりと身をかわした"
      else
      end
    end

end
