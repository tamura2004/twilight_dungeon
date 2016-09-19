require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item){build(:item)}

  it "妥当なオブジェクト" do
    expect(item).to be_valid
  end

  it "名前は空であってはならない" do
    item.name = ""
    expect(item).not_to be_valid
  end

end
