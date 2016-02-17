

post '/user/:user_id/post/:post_id/comment/new' do
  @comment = Comment.new(text: params[:comment][:text], post_id: params[:post_id], user_id: params[:user_id] )
  if @comment.save
    puts "[server_message] : answer saved"
    redirect '/user/dashboard'

  else
    puts "[server_message] : question did not saved"
  end
end


post '/user/comment/:comment_id/delete' do
  Comment.delete_comment(params[:comment_id])
 redirect '/user/profile'
end

get '/user/comment/:comment_id/edit' do
  @user = current_user
  @current_comment = Comment.find(params[:comment_id])
  erb :"static/edit_comment"
end

post '/user/comment/:comment_id/update' do
  @user = current_user
  @current_comment = Comment.find(params[:comment_id])
  @current_comment.update(text: params[:edit][:text])
  redirect 'user/profile'
end







