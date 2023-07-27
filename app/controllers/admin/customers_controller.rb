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
  end
  
  def customer_params
    params.require(:customer).permit(:email,:name)
  end
end
