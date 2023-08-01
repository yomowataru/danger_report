module Public::NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visitor
    # @comment = nil
    @visiter_comment = notification.comment_id

      @comment = Comment.find_by(id: @visiter_comment)
      @comment_content =@comment.comment
      # @micropost_title =@comment.report.title
      # tag.a(@visiter.name, href: customer_path(@visiter)) + 'が' + tag.a("#{@report_title}", href: report_path(notification.report_id)) + 'にコメントしました'
      'コメントがありました'
  end
end
