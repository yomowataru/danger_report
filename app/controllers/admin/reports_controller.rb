class Admin::ReportsController < ApplicationController
  def show
    @report = Report.find(params[:id])
    @comments = @report.comments
    # @comment = Comment.new
  end

  def update
    report = Report.find(params[:id])
    report.update(report_params)

    if params[:report][:status] == "1"
      report.update(is_finished: true)
      flash[:notice] = "対応済みです"

    elsif params[:report][:status] == "0"
      report.update(is_finished: false)
    end

    redirect_to admin_root_path
  end

  def destroy
  end

  def report_params
    params.require(:report).permit(:admin_id, :customer_id, :lat, :lng, :introduction, :image, tag_ids: [])
  end

end
