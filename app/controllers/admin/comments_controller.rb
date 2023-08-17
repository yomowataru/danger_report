class Admin::CommentsController < ApplicationController

  def destroy
    Comment.find_by(id: params[:id],report_id: params[:report_id]).destroy

    flash[:notice] = "コメントを削除しました。"
    redirect_to request.referer

  end
end
