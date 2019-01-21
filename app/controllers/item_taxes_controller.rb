class ItemTaxesController < ApplicationController
  def index
    @item_taxes= Item.find(params[:item_id]).item_taxes
  end

  def new
    @item_tax= ItemTax.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item_tax = ItemTax.new(item_tax_params)
    if @item_tax.save
      redirect_to @item_tax
      flash[:success] = "Item tax created successfully."
    else
      render 'new'
    end
  end

  def update
    @item_tax =  ItemTax.find(params[:id])
    if @item_tax.update_attributes(item_tax_params)
      redirect_to @item_tax
      flash[:success] = "Item tax updated successfully."
    else
      render 'edit'
    end
  end

  def show
    @item_tax =  ItemTax.find(params[:id])
  end

  def edit
    @item_tax =  ItemTax.find(params[:id])
  end

  def destroy
    ItemTax.find(params[:id]).destroy
    flash[:success] = "Item deleted"
    redirect_to item_taxes_url
  end

  private

  def item_tax_params
    params.require(:item_tax).permit(:id, :tax, :tax_type, :item_id)
  end  
end
