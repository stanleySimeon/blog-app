# Create user model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  validates :name, presence: true
  # validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end
end