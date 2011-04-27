$: << File.dirname(__FILE__)
$DUMMY = true

require 'json'
require 'sinatra'
require 'forecast'
require 'wtw'

get '/forecast' do
  location = params[:location]
  forecast = Forecast.new(location)
  forecast.fetch
  wtw = Wtw.new(forecast)
  wtw.to_json
end
