class Admin::OrdersController < ApplicationController
  def index
    @order = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if params[:order][:status] == "is_confirming"
      order.order_details.update(making_status: "is_waiting")
    end
    
    redirect_to admin_order_path(order.id)
  end
  
  private
  def order_params
      params.require(:order).permit(:status)
  end
end
