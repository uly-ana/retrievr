class OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user)
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.user = @user
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def new
    @order = Order.new
    authorize @order
  end

  def destroy
    @user = current_user
    @order = Order.find(params[:id])
    if Order.destroy
      redirect_to order_path(@order)
    else
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:amount_cents)
  end
end
