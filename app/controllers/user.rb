
get '/' do
  if logged_in?
    @user = current_user()
    erb :"static/user_profile"
  else
    erb :"static/index"
  end
end


post '/user/signup' do

  user = User.new(params[:user])

  if user.save
    session[:current_user_id] = user.id # sign in this user
    @mesage = "you have signed up successfully "
    puts "[sever_messgae] : user Signed up"
    redirect '/'
  else
    redirect @message = "please make sureyou entered the correct information "
  end
end


post '/user/login' do

   @u = User.authinticate(params[:user][:email],params[:user][:password])
    if @u.present?
    session[:current_user_id] = @u.id #  sign in this user
    puts "[sever_messgae] : user login"
    redirect '/user/dashboard'
  else
    puts"[server_message] sorry  can not login "
    redirect '/'

  end
end

get '/user/dashboard' do

  @list = Post.all.order(:id)
  @user = current_user
  erb :"static/main"
end

get '/user/profile' do
  @user = current_user
  puts "#{@user}"
  @posts = Post.find_my_posts("#{:user_id}")
  erb :"static/user_profile"
  end



get '/user/logout' do
  session[:current_user_id] = nil
  redirect '/'
end



