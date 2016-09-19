FactoryGirl.define do
  factory :action do
    name "攻撃"
    message ""
    association :source, factory: :player
    association :target, factory: :monster

    factory :player_attack do
      association :source, factory: :player
      association :target, factory: :monster
    end
  end
end
