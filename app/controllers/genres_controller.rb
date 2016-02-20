class GenreController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/genres' do
    @genre = Genre.all
    erb :"/genres/index"
  end
  
  get '/genres/:slug' do 
    @genre = Genre.find_by_slug(params[:slug])
    erb :"/genres/show"
  end
end