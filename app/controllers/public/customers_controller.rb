class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    if customer.email == 'guest@example.com'
      reset_session
      redirect_to root_path, alert: "ゲストユーザーは編集できません"
    else
      customer.update(customer_params)
      redirect_to customers_my_page_path
    end
  end

  def index
    @reports = current_customer.reports.all.order(created_at: :desc)
  end

  def check
  end

  def withdraw
    @customer = current_customer
    if @customer.email == 'guest@example.com'
      reset_session
      redirect_to root_path, alert: "ゲストユーザーは削除できません"
    else
      # is_deletedカラムをtrueに変更することにより削除フラグを立てる
      @customer.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email,:name)
  end
end
