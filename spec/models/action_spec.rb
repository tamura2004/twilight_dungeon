require 'rails_helper'

RSpec.describe Action, type: :model do
  let(:player){build(:player)}
  let(:monster){build(:monster)}
  let(:action){build(:action)}

  it "妥当なオブジェクト" do
    expect(action).to be_valid
  end

  context "攻撃" do
    it "クリティカルヒット" do
      player.update(at:10)
      monster.update(hp:100,df:0)
      action.update(name:"攻撃",source:player,target:monster)

      action.run(d20:20)

      expect(monster.hp).to eq 0
      expect(action.message).to match /#{player.name}の攻撃/
      expect(action.message).to match /クリティカルヒット！/
      expect(action.message).to match /#{monster.name}を倒した/
    end
  end
end
