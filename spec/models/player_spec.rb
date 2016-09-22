require 'rails_helper'

RSpec.describe Player, type: :model do
  subject{build :player}
  it{should be_valid}

  %w(level hp at df exp).each do |col|
    context "#{col}は0を許容" do
      subject{build :player, col => 0}
      it{should be_valid}
    end

    [nil,-1,"a"].each do |p|
      context "#{col}は#{p.inspect}でエラー" do
        subject{build :player, col => p}
        it{should_not be_valid}
      end
    end
  end

  %w(name skill).each do |col|
    context "#{col}は空ではならない" do
      subject{build :player, col => ""}
      it{should_not be_valid}
    end
  end

  context "生きているプレイヤー" do
    subject{create :player, hp: 100}
    it{should be_lived}
    it{should_not be_dead}
  end

  context "死んでいるプレイヤー" do
    subject{create :player, hp: 0}
    it{should_not be_lived}
    it{should be_dead}
  end

end
