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

  it "hp以下のダメージを受けた" do
    player.update(hp: 10)

    expect {
      player.damaged(3)
    }.to change {player.hp}.from(10).to(7)
  end

  it "hp以上のダメージを受けた" do
    player.update(hp: 10)

    expect {
      player.damaged(30)
    }.to change {player.hp}.from(10).to(0)
  end

    it "生きているプレイヤー" do
    player.save
    expect(player.lived?).to eq true
    expect(player.dead?).to eq false
    expect(Player.lived).to eq [player]
    expect(Player.dead).to eq []
  end

  it "死んでいるプレイヤー" do
    player.update(hp: 0)
    expect(player.lived?).to eq false
    expect(player.dead?).to eq true
    expect(Player.lived).to eq []
    expect(Player.dead).to eq [player]
  end


end
