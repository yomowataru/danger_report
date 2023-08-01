class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_customer.passive_notifications
    @notifications.where(check: false).each do |notification|
      notification.update(check: true)
    end
  end
end
