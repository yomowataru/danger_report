module Public::NotificationsHelper
  # def notification_form(notification)
    # @visiter = notification.visiter
    # @comment = nil
    # @visiter_comment = notification.comment_id

      # @comment = Comment.find_by(id: @visiter_comment)
      # @comment_content =@comment.comment
      # @micropost_title =@comment.report.title
      # tag.a(@visiter.name) + 'さんが' + tag.a("#{@report_introduction}", href: report_path(notification.report_id)) + 'にコメントしました'
      # 'コメントがありました'
  # end
  
  def unchecked_notifications
    @notifications = current_customer.passive_notifications.where(check: false)
  end
end
