class Comment < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  belongs_to :user
  belongs_to :post
  # has_many :answer_votes, dependent: :destroy


  def self.delete_comment(comment_id)
    @comment = Comment.find(comment_id)
    @comment.destroy

  end
end
