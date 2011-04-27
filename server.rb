$: << File.dirname(__FILE__)
$DUMMY = false

require 'json'
require 'sinatra'
require 'forecast'
require 'wtw'
require 'location'

get '/forecast' do
  location = Location.new(params[:location])
  location.parse
  forecast = Forecast.new(location)
  forecast.fetch
  wtw = Wtw.new(forecast)
  wtw.to_json
end
