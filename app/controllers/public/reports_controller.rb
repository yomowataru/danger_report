class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.save
    redirect_to  report_path(@report.id)
  end

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def destroy
  end

  private

  def report_params
    params.require(:report).permit(:lat, :lng, :introduction, :image, tag_ids: [])
  end
end
