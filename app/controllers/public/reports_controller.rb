class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    # カスタマーIDを保存する場合、↓の記述がないとエラー(保存されない)！！
    @report.customer_id = current_customer.id
    if @report.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to  report_path(@report.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @tags = Tag.all
    @reports = params[:name].present? ? Tag.find(params[:name]).reports : Report.all.order(created_at: :desc)
  end

  def show
    @report = Report.find(params[:id])
    @comments = @report.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_customer.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
                # currentと書かないと保存できない
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.customer_id = current_customer.id
    if @report.update(report_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to  report_path(@report.id)
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    report = Report.find(params[:id])  # データ（レコード）を1件取得
    report.destroy  # データ（レコード）を削除
    flash[:notice] = "投稿を削除しました。"
    redirect_to reports_path
  end





  private

  def report_params
    params.require(:report).permit(:admin_id, :customer_id, :lat, :lng, :introduction, :image, tag_ids: [])
  end
end
