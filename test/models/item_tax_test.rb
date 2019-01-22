require 'test_helper'

class ItemTaxTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @item_category = ItemCategory.create(name: "test item_category")
    @item = Item.create(name: "Example item", rate: 150, item_category_id: @item_category.id )
    @item_tax = ItemTax.create(tax: 150, tax_type: 'Value', item_id: @item.id)
  end

  test "should be valid" do
    assert @item_tax.valid?
  end

  test "tax should be present" do
    @item_tax.tax = ""
    assert_not @item_tax.valid?
  end

  test "tax_type should be present" do
    @item_tax.tax_type = ""
    assert_not @item_tax.valid?
  end
end
