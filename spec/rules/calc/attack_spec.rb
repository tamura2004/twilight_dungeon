require "rails_helper"

RSpec.describe Calc::Attack, type: :model do
  let(:attacker){create :player, at: 100}
  let(:calc){Calc::Attack.new}
  let(:action){
    create :action,
      name: "攻撃",
      source:attacker,
      target:defender
  }

  describe "#deal_damage" do
    subject{calc.deal_damage(attacker)}
    it{should be_between 80, 120}
  end

  describe "#take_damage" do
    context "攻撃力＞防御力" do
      let(:defender){create :monster, df: 100, hp: 300}
      it {
        expect {
          calc.take_damage(defender, 120)
        }.to change {
          defender.hp
        }.by(-20)
      }
    end

    context "攻撃力＜防御力" do
      let(:defender){create :monster, df: 200, hp: 300}
      it {
        expect {
          calc.take_damage(defender, 120)
        }.to change {
          defender.hp
        }.by(-6)
      }
    end
  end
end
