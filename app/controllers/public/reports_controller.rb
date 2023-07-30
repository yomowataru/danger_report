class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    # カスタマーIDを保存する場合、↓の記述がないとエラー(保存されない)！！
    @report.customer_id = current_customer.id
    @report.save
    redirect_to  report_path(@report.id)
  end

  def index
    @tags = Tag.all
    @reports = params[:name].present? ? Tag.find(params[:name]).reports : Report.all
    # @reports = Report.all

  end

  def show
    @report = Report.find(params[:id])
    @comments = @report.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_customer.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
                # currentと書かないと保存できない
  end

  def destroy

  end

  private

  def report_params
    params.require(:report).permit(:admin_id, :customer_id, :lat, :lng, :introduction, :image, tag_ids: [])
  end
end
