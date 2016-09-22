class PlayerHandbook::LevelUp
  delegate :log, :name, to: :player

  TBL = [10, 30, 60, 100,
    150, 210, 280, 360, 450,
    550, 660, 780, 910, 1050,
    1200, 1360, 1530, 1710, 1900
  ]

  def initialize(player)
    @player = player
  end

  def levelup!
    if @player.level < new_level
      @player.level = new_level
      @player.exp = 0
      log "レベルアップ！#{name}は#{new_level}レベルになった！"
    end
  end

  private
    def new_level
      @new_level ||= TBL.index{|exp|@player.exp < exp}
    end

end
