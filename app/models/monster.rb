class Monster < Creature
  belongs_to :game

  validates :name, presence: true
  validates :skill, presence: true

  validates :level, numericality: {greater_than_or_equal_to: 0}
  validates :hp, numericality: {greater_than_or_equal_to: 0}
  validates :at, numericality: {greater_than_or_equal_to: 0}
  validates :df, numericality: {greater_than_or_equal_to: 0}
  validates :exp, numericality: {greater_than_or_equal_to: 0}

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

  def victory?(player)
    if player.dead?
      update(exp: exp + player.exp)
      "#{player.name}は死んだ！"
    else
      ""
    end
  end

end
