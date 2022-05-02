class Customer::CustomersController < ApplicationController
  def show
  end
  
  def edit
  end
  
  def update
    current_customer.update(customer_params)
    redirect_to customers_mypage_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :phone_number, :email)
  end
end
