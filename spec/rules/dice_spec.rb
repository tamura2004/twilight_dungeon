require "rails_helper"

RSpec.describe Dice, type: :model do
  describe "self.roll" do
    it "パラメータ省略時はd20" do
      expect(Dice.roll).to be_between(1,20)
    end

    it "ダイスコード 3d6" do
      expect(Dice.roll("3d6")).to be_between(3,18)
    end

    it "ブロックあり" do
      expect(
        Dice.roll do |dice|
          "#{dice}ダメージ"
        end
      ).to match /\d+ダメージ/
    end
  end
end




