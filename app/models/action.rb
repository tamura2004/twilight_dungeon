class Action < ApplicationRecord
  belongs_to :source, class_name: "Creature"
  belongs_to :target, class_name: "Creature"

  def run(d20:nil)
    d20 ||= rand(20)+1

    case name
    when "攻撃"
      self.message = source.attack(target,d20)
    else
    end

    self.message += source.victory?(target)
  end

end
