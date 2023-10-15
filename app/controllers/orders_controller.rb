class OrdersController < ApplicationController


  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


private

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: order_params[:price],
    card: order_params[:token],
    currency: 'jpy'
  )
end

def order_params
  params.require(:order).permit(:price, :card_information, :month, :day, :security_code).merge(token: params[:token])
end


end
