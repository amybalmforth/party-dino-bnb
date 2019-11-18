require 'sinatra/base'
require 'pg'
require './lib/space'

class Dinosaur_Bnb < Sinatra::Base
  get '/spaces' do
    @spaces = Spaces.all.reverse
    erb :spaces
  end


  run! if app_file == $0
end
