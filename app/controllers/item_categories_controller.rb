class ItemCategoriesController < ApplicationController
  before_action :find_category, only: [:update, :show, :edit, :destroy]

  def index
    @item_categories = ItemCategory.all
  end

  def new
    @item_category = ItemCategory.new
  end

  def create
    @item_category = ItemCategory.new(item_category_params)
    if @item_category.save
      redirect_to @item_category
      flash[:success] = "item category created successfully."
    else
      render 'new'
    end
  end

  def update
    if @item_category.update_attributes(item_category_params)
      redirect_to @item_category
      flash[:success] = "item category updated successfully."
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def show; end

  def edit; end

  def destroy
    @item_category.destroy
    flash[:success] = "User deleted"
    redirect_to item_categories_url
  end



  private

  def find_category
    @item_category =  ItemCategory.find(params[:id])
  end

  def item_category_params
    params.require(:item_category).permit(:id, :name)
  end
end
