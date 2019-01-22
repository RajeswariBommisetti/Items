require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @item_category = ItemCategory.create(name: "test item_category")
    @item = Item.new(name: "Example item", rate: 140, item_category_id: @item_category.id )
  end

  test "should be valid" do
    assert @item.valid?
  end

  test "name should be present" do
    @item.name = ""
    assert_not @item.valid?
  end

  test "rate should be present" do
    @item.rate = ""
    assert_not @item.valid?
  end
end
