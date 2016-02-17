class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  has_secure_password
  validates_uniqueness_of :email , message: "Invalid Email"
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create


  has_many :posts
  # has_many :question_votes

  has_many :comments
  # has_many :answer_votes



  def self.authinticate(email,password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      return @user
    else
      return false
    end
  end
end
