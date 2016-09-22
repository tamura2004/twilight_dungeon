class Player < Creature
  has_many :items

  delegate :levelup!, to: :rule

  after_initialize do
    @rule = PlayerHandbook::LevelUp.new(self)
  end

  def die!
    super
    log "#{name}は死んでしまった！"
  end

  def get_exp(monster)
    update(exp: exp + monster.exp)
    log "#{monster.exp}経験点を得た。"
  end

end
