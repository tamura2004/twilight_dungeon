FactoryGirl.define do
  factory :player do
    name "ボブ"
    skill "ファイアボール"
    level 10
    hp 100
    at 50
    df 10
    exp 1000
    association :game, factory: :game
  end
end
