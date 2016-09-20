require 'rails_helper'

RSpec.describe Action, type: :model do
  let(:monster){build(:monster, hp:16, at:1, df:2, exp:64)}
  let(:player){build(:player, hp:32, at:4, df:8, exp:128)}

  context "プレイヤーの攻撃" do
    let(:action){build(:action, name: "攻撃", source: player, target: monster)}
    let(:attack) {action.run(d20: dice)}

    context "クリティカルヒット" do
      let(:dice){20}

      describe "#message" do
        before{attack}
        subject {action.message}
        it { is_expected.to match /#{player.name}は#{monster.name}を攻撃/}
        it { is_expected.to match /クリティカルヒット！/}
        it { is_expected.to match /#{monster.name}を倒した/}
      end

      it "敵は死ぬ" do
        expect {attack}.to change{monster.hp}.to 0
      end

      it "倒した敵の経験値を得る" do
        expect {attack}.to change {player.exp}.to 64 + 128
      end
    end

    context "ファンブル！" do
      let(:dice){1}

      describe "#message" do
        before{attack}
        subject {action.message}
        it { is_expected.to match /#{player.name}は#{monster.name}を攻撃/ }
        it { is_expected.to match /ファンブル！/ }
      end

      it "敵のhpに変化なし" do
        expect {attack}.not_to change {monster.hp}
      end

      it "経験値変わらず" do
        expect {attack}.not_to change {player.exp}
      end
    end

    context "通常攻撃（出目10）" do
      let(:dice){10}

      describe "攻撃力1.0倍" do
        before{attack}
        subject {action.message}
        it { is_expected.to match /#{player.name}は#{monster.name}を攻撃/ }
        it { is_expected.to match /#{monster.name}に2ダメージ/ }
      end

      it "攻撃力4 - 防御力2 = 2のダメージ" do
        expect {attack}.to change {monster.hp}.from(16).to(14)
      end

      it "経験値変わらず" do
        expect {attack}.not_to change {player.exp}
      end
    end

    context "通常攻撃（出目15）" do
      let(:dice){15}

      describe "攻撃力1.5倍" do
        before{attack}
        subject {action.message}
        it { is_expected.to match /#{player.name}は#{monster.name}を攻撃/ }
        it { is_expected.to match /#{monster.name}に4ダメージ/ }
      end

      it "攻撃力6 - 防御力2 = 2のダメージ" do
        expect {attack}.to change {monster.hp}.from(16).to(12)
      end

      it "経験値変わらず" do
        expect {attack}.not_to change {player.exp}
      end
    end

    context "通常攻撃（出目5）" do
      let(:dice){5}

      describe "攻撃力0.5倍 ... ダイスの出目がダメージ" do
        before{attack}
        subject {action.message}
        it { is_expected.to match /#{player.name}は#{monster.name}を攻撃/ }
        it { is_expected.to match /#{monster.name}に5ダメージ/ }
      end

      it "攻撃力6 - 防御力2 = 2のダメージ" do
        expect {attack}.to change {monster.hp}.from(16).to(11)
      end

      it "経験値変わらず" do
        expect {attack}.not_to change {player.exp}
      end
    end

  end
end
