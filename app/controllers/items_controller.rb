class ItemsController < ApplicationController
  def index
    @items = ItemCategory.find(params[:item_id]).items
  end

  def new
    @item= Item.new
    @item_category = ItemCategory.find(params[:id])
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
    @item =  Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to @item
      flash[:success] = "Item updated successfully."
    else
      render 'edit'
    end
  end

  def show
    @item =  Item.find(params[:id])
  end

  def edit
    @item =  Item.find(params[:id])
    @item_category = ItemCategory.find(params[:item_category_id])
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "Item deleted"
    redirect_to items_url
  end

  def tax_details
    @selected_items= Item.where(id: params[:item_ids])
    @subtotal= @selected_items.sum(&:rate)
    render json: { content: render_to_string(:template => "items/_tax_details", :locals => {:selected_items => @selected_items, sub_total: @sub_total}) }
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :rate, :item_category_id)
  end
end
