class Comment < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  
  validates :body, presence: true
  belongs_to :post
  belongs_to :user
end
