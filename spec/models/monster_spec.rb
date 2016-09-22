require 'rails_helper'

RSpec.describe Monster, type: :model do
  subject{build(:monster)}
  it{should be_valid}

  %w(level hp at df exp).each do |col|
    context "#{col}は0を許容" do
      subject{build :monster, col => 0}
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
      subject{build :monster, col => ""}
      it{should_not be_valid}
    end
  end

  context "名前がゴブリンの場合パラメータ自動セット" do
    subject{create :monster, name: "ゴブリン"}
    it{should have_attributes level:1,hp:2,at:4,df:1,exp:10}
  end

end
