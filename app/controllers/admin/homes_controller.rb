class Admin::HomesController < ApplicationController
  def top
    @tags = Tag.all
    @reports = params[:name].present? ? Tag.find(params[:name]).reports : Report.all
  end
end
