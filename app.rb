require 'sinatra/base'
require_relative 'lib/space'
require_relative 'lib/user'

class Dinosaur_Bnb < Sinatra::Base
  enable :sessions

  DataMapper.setup :default, "postgres://#{ENV["USER"]}@localhost/party_dino_bnb"
  DataMapper.finalize
  DataMapper.auto_migrate!


  get '/' do
    erb(:index)
  end

  get '/create' do
    erb(:create)
  end

  post '/new-space' do
    Space.create(name: params[:property_name], description: params[:description], price: params[:price_per_night], available_from: params[:available_from], available_to: params[:available_to], created_by: session['userID'])
    redirect '/spaces'
  end

  get '/spaces' do
    @user = session['userUSERNAME']
    @spaces = Space.all.reverse
    erb :spaces
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session['userID'] = user.id
    redirect '/spaces'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.first(:username => params[:username])
    redirect '/signup' if user == nil
    redirect '/login' if user.password != params[:password]
    session['userID'] = user.id
    redirect '/spaces'
  end

  post '/spaces/edit' do
    session['edit_space'] = Space.first(:id => params[:Edit])
    redirect '/spaces/edit'
  end

  get '/spaces/edit' do
    @edit_space = session['edit_space']
    erb :edit
  end

  post '/spaces/update' do
    Space.update(id: session['edit_space'].id, name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to])
    redirect '/spaces'
  end

  post '/spaces/request' do
    session['requested_space'] = Space.first(:id => params[:Request])
    redirect '/spaces/request'
  end

  get '/spaces/request' do
    @requested_space = session['requested_space']
    erb :request
  end

  post '/spaces/confirm' do
    redirect '/spaces/confirm'
  end

  get '/spaces/confirm' do
    erb :confirm
  end

  post '/logout' do
    session['user'] = nil
    redirect '/'
  end

  run! if app_file == $0
end
