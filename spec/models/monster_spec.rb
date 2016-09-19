require 'rails_helper'

RSpec.describe Monster, type: :model do
  let(:monster){FactoryGirl.build(:monster)}

  it "妥当なオブジェクト" do
    expect(monster).to be_valid
  end

  %w(level hp at df exp).each do |col|
    it "#{col}は０以上の数字である" do
      monster[col] = 0
      expect(monster).to be_valid

      [nil,-1,"a"].each do |p|
        monster[col] = p
        expect(monster).not_to be_valid
      end
    end
  end

  %w(name skill).each do |col|
    it "#{col}は空ではならない" do
      monster[col] = ""
      expect(monster).not_to be_valid
    end
  end

  it "名前がゴブリンの場合パラメータ自動セット" do
    monster = Monster.create(name: "ゴブリン")
    expect(monster.level).to eq 1
    expect(monster.hp).to eq 2
    expect(monster.at).to eq 4
    expect(monster.df).to eq 1
    expect(monster.exp).to eq 10
  end

  it "hp以下のダメージを受けた" do
    monster.update(hp: 10)

    expect {
      monster.damaged(3)
    }.to change {monster.hp}.from(10).to(7)
  end

  it "hp以上のダメージを受けた" do
    monster.update(hp: 10)

    expect {
      monster.damaged(30)
    }.to change {monster.hp}.from(10).to(0)
  end

  it "生きているモンスター" do
    monster.save
    expect(Monster.lived).to eq [monster]
    expect(Monster.dead).to eq []
  end

  it "死んでいるモンスター" do
    monster.hp = 0
    monster.save
    expect(Monster.lived).to eq []
    expect(Monster.dead).to eq [monster]
  end

end
