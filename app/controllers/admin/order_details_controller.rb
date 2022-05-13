class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order = order_detail.order
    order_details = order.order_details
    order_detail.update(order_detail_params)
    if params[:order_detail][:making_status] == "is_making"
      order.update(status: "is_making")
    end
    
    if order_details.size == order_details.where(making_status: "completed").size
      order.update(status: "is_preparing")
    end
    
    redirect_to admin_order_path(order_detail.order.id)
  end
  
  private
  def order_detail_params
      params.require(:order_detail).permit(:making_status)
  end
end
