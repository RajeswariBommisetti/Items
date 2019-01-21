class Item < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :rate, presence: true
  # Associations
  has_many :item_taxes, dependent: :destroy
  belongs_to :item_category
end
