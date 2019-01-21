class CreateItemTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_taxes do |t|
      t.integer :tax
      t.integer :tax_type
      t.references :item
      t.timestamps
    end
  end
end
