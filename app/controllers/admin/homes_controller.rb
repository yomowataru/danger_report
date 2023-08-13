class Admin::HomesController < ApplicationController
  def top
    @tags = Tag.all
    @reports = params[:name].present? ? Tag.find(params[:name]).reports.order(created_at: :desc) : Report.all.order(created_at: :desc)
    # ↓共通テンプレート用にパスを変数化
    @link = admin_report_path(@reports.ids)
  end

  def index
    @finished = Report.where(is_finished: false).order(created_at: :desc)
  end
end
