class Action < ApplicationRecord
  belongs_to :source, class_name: "Creature"
  belongs_to :target, class_name: "Creature"
  has_one :game, through: :source

  delegate :run!, to: :@dungeon_master
  delegate :log, to: :game

  after_initialize do
    @dungeon_master = DungeonMaster.new(self)
  end

  def log(str)
    self.message += str + "\n"
  end

end









