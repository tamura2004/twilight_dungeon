FactoryGirl.define do
  factory :item do
    name "炎の剣"
    association :player, factory: :player
  end
end
