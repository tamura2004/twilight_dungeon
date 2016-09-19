FactoryGirl.define do
  factory :game do
    depth 10
    score 100
    association :dungeon, factory: :dungeon, name: "竜の洞窟", level: 10, depth: 20
  end
end
