class ItemTax < ApplicationRecord
  # Validations
  validates :tax, presence: true
  validates :tax_type, presence: true
  # Associations
  belongs_to :item

  enum tax_type: { Percentage: 0, Value: 1 }
end
