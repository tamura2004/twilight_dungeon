class PlayerHandbook::Attack
  attr_accessor :player, :action
  delegate :log, to: :action

  def initialize(player=nil, action=nil)
    @player, @action = player, action
    yield self if block_given?
  end



end
