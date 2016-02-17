class Post < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  belongs_to :user
  has_many :comments, dependent: :destroy
  # has_many :question_votes, dependent: :destroy

  def self.find_my_posts(current_user_id)
    @posts = Post.where(user_id: current_user_id)
  end

  # def self.find_post(post_id)
  #   @currsnt_post = Post.find(post_id)
  # end

  def self.delete_post(post_id)
    @post = Post.find(post_id)
    @post.destroy

  end
end
