class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_index_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_information_id_id, :product_condition_id, :delivery_charge_id, :shipping_days_id, :price, :region_of_origin_id, :image).merge(user_id: current_user.id)
  end


end
