require 'sinatra/base'
require 'pg'
require './lib/space'
require './lib/user'

class Dinosaur_Bnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/create' do
    erb(:create)
  end

  post '/new-space' do
    Spaces.create(name: params[:property_name], description: params[:description], price: params[:price_per_night], available_from: params[:available_from], available_to: params[:available_to])
    redirect '/spaces'
  end

  get '/spaces' do
    @user = session['user']
    @spaces = Spaces.all.reverse
    erb :spaces
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session['user'] = Users.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/spaces'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    redirect '/spaces'
  end

  run! if app_file == $0
end
