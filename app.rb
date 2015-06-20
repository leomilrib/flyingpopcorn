require 'sinatra'
require 'sinatra/flash'
require './app_helpers'

get '/' do
  @today = Date.today.strftime('%d/%m/%y')
  erb :index
end

post '/' do
  @today = Date.today.strftime('%d/%m/%y')
  @result = calc_passes(params)
  erb :index
end

get '/about' do
  erb :about
end
