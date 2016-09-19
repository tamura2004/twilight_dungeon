FactoryGirl.define do
  factory :action do
    name "攻撃"
    association :source, factory: :player
    association :target, factory: :monster
    message ""
  end
end
