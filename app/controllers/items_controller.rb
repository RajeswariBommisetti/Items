class ItemsController < ApplicationController
  before_action :find_item, only: [:update, :show, :edit, :destroy]
  def index
    @items = ItemCategory.find(params[:item_category_id]).items
  end

  def new
    @item= Item.new
    @item_category = ItemCategory.find(params[:item_category_id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
      flash[:success] = "Item created successfully."
    else
      render 'new'
    end
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to @item
      flash[:success] = "Item updated successfully."
    else
      render 'edit'
    end
  end

  def show;end

  def edit
    @item_category = ItemCategory.find(params[:item_category_id])
  end

  def destroy
    item_category_id = @item.item_category_id
    @item.destroy
    flash[:success] = "Item deleted"
    redirect_to items_url(item_category_id: @item.item_category_id)
  end

  def tax_details
    @selected_items= Item.where(id: params[:item_ids])
    @subtotal= @selected_items.sum(&:rate)
    render json: { content: render_to_string(:template => "items/_tax_details", :locals => {:selected_items => @selected_items, sub_total: @sub_total}) }
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:id, :name, :rate, :item_category_id)
  end
end
