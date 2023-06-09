class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :likes
  
    after_save :update_post_counter
  
    def recent_comments(limit = 5)
      Comment.order(created_at: :desc).limit(limit)
    end
  
    def last_five_comments
      Comment.last(5)
    end
  
    private
  
    def update_post_counter
      author.increment!(:posts_counter)
    end
  end
  