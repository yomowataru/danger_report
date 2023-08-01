class Comment < ApplicationRecord
  belongs_to :customer  #Comment.userでコメントの所有者を取得
  belongs_to :report  #Comment.postでそのコメントがされた投稿を取得
  has_many :notifications, dependent: :destroy
  
  
  
end
