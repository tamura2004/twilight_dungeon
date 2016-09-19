class Item < ApplicationRecord
  belongs_to :player

  validates :name, presence: true
end
