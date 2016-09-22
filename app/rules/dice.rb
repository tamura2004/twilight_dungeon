class Dice
  def self.roll(dice_code="1d20")
    n,m = dice_code.split(/d/i).map(&:to_i)
    num = n.times.map{rand(m)+1}.sum
    if block_given? then yield num else num end
  end
end
