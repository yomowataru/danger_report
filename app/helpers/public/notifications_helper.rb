module Public::NotificationsHelper
    def unchecked_notifications
    @notifications = current_customer.passive_notifications.where(check: false)
  end
end
