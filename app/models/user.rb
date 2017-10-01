class User < ApplicationRecord
  has_many :posts
  has_many :comments

  extend FriendlyId
    friendly_id :first_name, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader 
end
