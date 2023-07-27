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
      flash[:notice] = "退会処理を実行いたしました"

    elsif params[:customer][:status] == "0"
      customer.update(is_deleted: false)
    end

    redirect_to admin_customer_path(customer.id)
  end
  
  def customer_params
    params.require(:customer).permit(:email,:name)
  end
end
