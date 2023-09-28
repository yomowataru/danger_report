class Report < ApplicationRecord
  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?

  has_one_attached :image

  validates :lat, presence: true
  validates :lng, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :tag_ids, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  has_many :comments, dependent: :destroy
  has_many :report_tags, dependent: :destroy
  has_many :tags, through: :report_tags, dependent: :destroy
  belongs_to :customer
  has_many :notifications, dependent: :destroy

  def create_notification_comment(current_customer, comment_id)
    temp_ids = Comment.where(report_id: id).select(:customer_id).where.not("customer_id = ? or customer_id = ?", current_customer.id, customer_id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment(current_customer, comment_id, temp_id['customer_id'])#save_notification_comment!ビックリマークを入れるとカレントユーザーがコメントできない
    end
    save_notification_comment(current_customer, comment_id, customer_id)
  end

  def save_notification_comment(current_customer, comment_id, visited_id)#(通知をした人,通知されたコメント,通知された人)
    notification = current_customer.active_notifications.new(
      report_id: id,
      comment_id: comment_id,
      visited_id: visited_id
    )
    if notification.visiter_id == notification.visited_id
      notification.check = true
    end
    notification.save if notification.valid?
  end


end
