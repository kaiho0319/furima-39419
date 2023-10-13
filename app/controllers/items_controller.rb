class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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


def show
  @user = @item.user
end

def edit
end

def update
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit
  end
end

def destroy
  @item.destroy
  redirect_to root_path
end



  private

  def set_item
    @item = Item.find(params[:id])
  end

  def authorize_user
    unless user_signed_in?
      redirect_to new_user_session_path
    end

    if user_signed_in? && current_user != @item.user
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_information_id, :item_condition_id, :shipping_responsibility_id, :processing_time_id, :price, :shipping_origin_id, :image).merge(user_id: current_user.id)
  end


end
