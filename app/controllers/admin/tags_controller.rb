class Admin::TagsController < ApplicationController

  def new
    @tag = Tag.new
    @tags = Tag.all

  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to  new_admin_tag_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to  new_admin_tag_path
  end


  def tag_params
    params.require(:tag).permit(:name)
  end

end
