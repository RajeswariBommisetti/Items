class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :rate
      t.references :item_category
      t.timestamps
    end
  end
end
