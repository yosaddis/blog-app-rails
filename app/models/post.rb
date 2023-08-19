class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_counters

  def last_comments
    Comments.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private

  def update_counters
    User.find(author_id).update(posts_counter: Post.where(author_id:).count)
  end
end
