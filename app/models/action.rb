class Action < ApplicationRecord
  belongs_to :source, class_name: "Creature"
  belongs_to :target, class_name: "Creature"
end
