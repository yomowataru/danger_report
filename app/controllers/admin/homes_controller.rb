class Admin::HomesController < ApplicationController
  def top
    @tags = Tag.all
    @reports = params[:name].present? ? Tag.find(params[:name]).reports : Report.all
    
  end
  
  def index
    @finished = Report.where(is_finished: false)
  end
end
