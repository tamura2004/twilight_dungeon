require 'rails_helper'

RSpec.describe Dungeon, type: :model do
  let(:dungeon) {FactoryGirl.build(:dungeon)}

  it "妥当なオブジェクト" do
    expect(dungeon).to be_valid
  end

  it "名前は空であってはならない" do
    dungeon.name = ""
    expect(dungeon).not_to be_valid
  end

  %w(level depth).each do |col|
    it "#{col}は正の整数に限る" do
      [nil,0,-1,"a"].each do |p|
        dungeon.level = p
        expect(dungeon).not_to be_valid
      end
    end
  end

end
