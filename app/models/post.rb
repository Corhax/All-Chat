class Post < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.keyword_search(keywords)
    keywords = "%" + keywords + "%"
    Post.where("body LIKE ? OR user_id LIKE ?", keywords, keywords)
  end
end
