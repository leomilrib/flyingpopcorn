require 'sinatra'
require 'sinatra/flash'
require './app_helpers'

get '/' do
  @today = Date.today.strftime('%d/%m/%Y')
  erb :index
end

post '/' do
  @today = Date.today.strftime('%d/%m/%Y')
  @result = calc_passes(params)
  erb :index
end

get '/about' do
  erb :about
end
