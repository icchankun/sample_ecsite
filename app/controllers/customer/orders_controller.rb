class Customer::OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @addresses = current_customer.addresses
    if !current_customer.cart_items.present?
      redirect_to cart_items_path
    end
  end
  
  def create
    @order = current_customer.orders.new(order_params)
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item.id
      order_detail.price = cart_item.item.with_tax_price
      order_detail.amount = cart_item.amount
      order_detail.save
      cart_item.destroy
    end
    redirect_to complete_orders_path
  end
  
  def show
  end

  def confirm
    @cart_items = current_customer.cart_items
    if @cart_items.present?
      @order = Order.new(order_params)
      
      @select_address = params[:order][:select_address].to_i
      case @select_address
        when 0
          @order.post_code = current_customer.post_code
          @order.address = current_customer.address
          @order.name = current_customer.first_name + current_customer.last_name
        when 1
          @address = Address.find(params[:order][:address_id])
          @order.post_code = @address.post_code
          @order.address = @address.place
          @order.name = @address.name
        when 2
          @order.post_code = params[:order][:post_code]
          @order.address = params[:order][:address]
          @order.name = params[:order][:name]
      end
      @order.shipping_cost = 800
      @order.payment_method = params[:order][:payment_method]
    else
      redirect_to root_path
    end
  end

  def complete
  end
  
  private
  
  def order_params
    params.require(:order).permit(:post_code, :address, :name, :shipping_cost, :total_payment, :payment_method )
  end
end
