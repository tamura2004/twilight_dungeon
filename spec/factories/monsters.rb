FactoryGirl.define do
  factory :monster do
    name "マーフィーの幽霊"
    skill "叫ぶ"
    level 1
    hp 5
    at 4
    df 1
    exp 100
    association :game, factory: :game
  end
end
