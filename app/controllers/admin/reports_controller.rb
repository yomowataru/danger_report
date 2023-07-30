class Admin::ReportsController < ApplicationController
  def show
    @report = Report.find(params[:id])
    @comments = @report.comments
    # @comment = Comment.new
  end

  def destroy
  end

  def report_params
    params.require(:report).permit(:admin_id, :customer_id, :lat, :lng, :introduction, :image, tag_ids: [])
  end

end
