require_relative 'application_record'

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comment_counter

  private

  def update_comment_counter
    Post.find(post_id).update(comments_counter: Comment.where(post_id:).count)
  end
end
