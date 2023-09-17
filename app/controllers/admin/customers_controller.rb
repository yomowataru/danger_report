class Admin::CustomersController < ApplicationController
  
  
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @reports = Report.where(customer_id:params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer =  Customer.find(params[:id])
    customer.update(customer_params)

    if params[:customer][:status] == "1"
      customer.update(is_deleted: true)
    elsif params[:customer][:status] == "0"
      customer.update(is_deleted: false)
    end
    flash[:notice] = "会員情報を編集しました。"
    redirect_to admin_customer_path(customer.id)
  end

  def customer_params
    params.require(:customer).permit(:email,:name)
  end
  
  
  
end
