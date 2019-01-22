require 'test_helper'

class ItemCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @item_category = ItemCategory.new(name: "Example Category")
  end

  test "should be valid" do
    assert @item_category.valid?
  end

  test "name should be present" do
    @item_category.name = ""
    assert_not @item_category.valid?
  end
end
