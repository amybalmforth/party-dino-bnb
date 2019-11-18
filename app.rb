require 'sinatra/base'
require 'pg'

class Dinosaur_Bnb < Sinatra::Base

get '/' do
  erb(:index)
end

get '/create' do
  erb(:create)
end


  run! if app_file == $0
end
