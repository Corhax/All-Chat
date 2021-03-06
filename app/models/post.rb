class Post < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  
  def self.keyword_search(keywords)
    keywords = "%" + keywords + "%"
    Post.where("body ILIKE ?", keywords)
  end
end
