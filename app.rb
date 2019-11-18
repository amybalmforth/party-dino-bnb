require 'sinatra/base'
require 'pg'
require './lib/space'

class Dinosaur_Bnb < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/create' do
    erb(:create)
  end

  get '/spaces' do
    @spaces = Spaces.all.reverse
    erb :spaces
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    # params[:name]
    # params[:username]
    # params[:email]
    # params[:password]
    redirect '/login'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    redirect '/spaces'
  end

  run! if app_file == $0
end
