


post '/user/:user_id/post/new' do
  post = Post.new(text: params[:post][:text], user_id: params[:user_id] )
  if post.save
    puts "[server_message] : post saved"
    redirect '/user/profile'

  else
    puts "[server_message] : post did not saved"
  end

end



post '/user/post/:post_id/delete' do
  Post.delete_post(params[:post_id])
 redirect '/user/profile'
end

get '/user/post/:post_id/edit' do
  @user = current_user
  @current_post = Post.find(params[:post_id])
  erb :"static/edit_post"
end

post '/user/post/:post_id/update' do
  @user = current_user
  @current_post = Post.find(params[:post_id])
  @current_post.update(text: params[:edit][:text])
  redirect '/user/dashboard'
end








