class DungeonMaster
  delegate :run!, to: :rule_book

  def initialize(action)
    case action.name
    when "攻撃"
      @rule_book = DungeonMastersGuild::Attack.new(action)
    end
  end
end