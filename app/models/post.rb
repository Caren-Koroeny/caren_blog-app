class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    Comment.last(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end