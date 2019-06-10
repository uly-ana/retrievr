class OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user)
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
    activity = Activity.find(params[:activity_id])
    order = Order.create!(activity_sku: activity.sku, amount: activity.price, status: "pending", user: current_user)
    # raise
    authorize order
    redirect_to new_order_payment_path(order)
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
