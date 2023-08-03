class Admin::CommentsController < ApplicationController
  # def create
    # @comment = Comment.new(comment_params)
    # if @comment.save
      # redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    # else
      # redirect_back(fallback_location: root_path)  #同上
    # end
  # end

  # private
  # def comment_params
    # params.require(:comment).permit(:comment, :report_id)
  # end

  def destroy
    Comment.find_by(id: params[:id],report_id: params[:report_id]).destroy


    redirect_to request.referer

  end
end
