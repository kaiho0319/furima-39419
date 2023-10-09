class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order(created_at: :desc)
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


  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_information_id, :item_condition_id, :shipping_responsibility_id, :processing_time_id, :price, :shipping_origin_id, :image).merge(user_id: current_user.id)
  end


end
