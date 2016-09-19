require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game){build(:game)}

  it "妥当なオブジェクト" do
    expect(game).to be_valid
  end

  it "攻略対象のダンジョンの最深部より深く潜れてはダメ" do
    game.depth = 10
    game.dungeon.depth = 9
    expect(game).not_to be_valid
  end

end
