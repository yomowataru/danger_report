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
  end

  def show
  end

  def destroy
  end

  private

  def report_params
    params.require(:report).permit(:customer_id, :tag_id, :adress, :latitude, :longitude, :introduction, tag_ids: [])
  end
end
