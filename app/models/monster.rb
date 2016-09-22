class Monster < Creature

  before_validation do
    case name
    when "ゴブリン"
      self.skill = "殴る"
      self.level = 1
      self.hp = 2
      self.at = 4
      self.df = 1
      self.exp = 10
    end
  end

  def die!
    super
    log "#{name}を倒した！"
  end

end
