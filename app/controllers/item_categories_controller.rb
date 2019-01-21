class ItemCategoriesController < ApplicationController
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
    @item_category =  ItemCategory.find(params[:id])
    if @item_category.update_attributes(item_category_params)
      redirect_to @item_category
      flash[:success] = "item category updated successfully."
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def show
    @item_category =  ItemCategory.find(params[:id])
  end

  def edit
    @item_category =  ItemCategory.find(params[:id])
  end

  def destroy
    ItemCategory.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to item_categories_url
  end



  private

  def item_category_params
    params.require(:item_category).permit(:id, :name)
  end
end
