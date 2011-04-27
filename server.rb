$: << File.dirname(__FILE__)
$DUMMY = true

require 'sinatra'
require 'forecast'
require 'json'

get '/forecast' do
  location = params[:location]
  forecast = Forecast.new(location)
  forecast.fetch
  forecast.to_json
end
