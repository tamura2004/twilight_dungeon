require 'rails_helper'

RSpec.describe Action, type: :model do
  it "妥当なオブジェクト" do
    expect(build(:action)).to be_valid
  end

  context "プレイヤーの攻撃" do
    let(:action){build(:player_attack)}

    context "クリティカルヒット" do
      before {action.run(d20:20)}

      describe "#message" do
        subject {action.message}
        it { is_expected.to match /#{action.source.name}の攻撃/ }
        it { is_expected.to match /クリティカルヒット！/ }
        it { is_expected.to match /#{action.target.name}を倒した/ }
      end

      describe "#target.hp" do
        subject {action.target.hp}
        it { is_expected.to eq 0 }
      end
    end
  end
end
