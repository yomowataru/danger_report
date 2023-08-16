class Admin::ReportsController < ApplicationController
  def show
    @report = Report.find(params[:id])
    @comments = @report.comments
  end

  def update
    report = Report.find(params[:id])
    report.update(report_params)

    if params[:report][:status] == "1"
      report.update(is_finished: true)

    elsif params[:report][:status] == "0"
      report.update(is_finished: false)
    end
    flash[:notice] = "対応ステータスを更新しました。"
    redirect_to request.referer
  end

  def destroy
    report = Report.find(params[:id])  # データ（レコード）を1件取得
    report.destroy  # データ（レコード）を削除
    flash[:notice] = "投稿を削除しました。"
    redirect_to admin_root_path
  end



  def report_params
    params.require(:report).permit(:admin_id, :customer_id, :lat, :lng, :introduction, :image, tag_ids: [])
  end

end
