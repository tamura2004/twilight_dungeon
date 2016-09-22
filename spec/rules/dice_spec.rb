require "rails_helper"

RSpec.describe Dice, type: :model do
  describe "self.roll" do
    context "パラメータ省略時はd20" do
      subject{Dice.roll}
      it{should be_between 1,20}
    end

    context "ダイスコード 3d6" do
      subject{Dice.roll "3d6"}
      it{should be_between 3,18}
    end

    context "ブロックあり" do
      subject {
        Dice.roll do |dice|
          "#{dice}ダメージ"
        end
      }
      it{should match /\d+ダメージ/}
    end
  end
end




