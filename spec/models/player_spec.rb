require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player){build(:player)}

  it "妥当なオブジェクト" do
    expect(player).to be_valid
  end

  %w(level hp at df exp).each do |col|
    it "#{col}は０以上の数字である" do
      player[col] = 0
      expect(player).to be_valid

      [nil,-1,"a"].each do |p|
        player[col] = p
        expect(player).not_to be_valid
      end
    end
  end

  %w(name skill).each do |col|
    it "#{col}は空ではならない" do
      player[col] = ""
      expect(player).not_to be_valid
    end
  end

  context "被ダメージ" do
    it "hp以下のダメージを受けた" do
      expect {player.damaged(70)}.to change {player.hp}.from(100).to(30)
    end

    it "hp以上のダメージを受けた" do
      expect {player.damaged(300)}.to change {player.hp}.from(100).to(0)
    end
  end

  it "生きているプレイヤー" do
    player.save
    expect(player).to be_lived
    expect(player).not_to be_dead
    expect(Player.lived).to eq [player]
    expect(Player.dead).to eq []
  end

  it "死んでいるプレイヤー" do
    player = create(:player, hp: 0)
    expect(player).not_to be_lived
    expect(player).to be_dead
    expect(Player.lived).to eq []
    expect(Player.dead).to eq [player]
  end


end
