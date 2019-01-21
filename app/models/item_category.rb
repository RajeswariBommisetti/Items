class ItemCategory < ApplicationRecord
  # Validations
  validates :name, presence: true
  # Associations
  has_many :items, dependent: :destroy
end
