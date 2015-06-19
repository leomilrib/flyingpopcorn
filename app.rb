require 'sinatra'
require 'sinatra/flash'
require './app_helpers'

get '/' do
  erb :'index'
end

post '/' do
  @result = calc_passes(params)
  erb :'index'
end

get '/about' do
  erb :'about'
end
