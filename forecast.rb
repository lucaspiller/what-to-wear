require 'date'
require 'nokogiri'

class Forecast
  attr_reader :location, :time, :symbol, :precipitation, :temperature, :windspeed

  def initialize(location)
    @location = location
  end

  def fetch
    fetch_data

    @time = DateTime.parse(@forecast.xpath('@from[1]').to_s)
    @symbol = @forecast.xpath('symbol/@name[1]').to_s.downcase
    @precipitation = @forecast.xpath('precipitation/@value[1]').to_s.to_i
    @temperature = @forecast.xpath('temperature[@unit="celsius"]/@value[1]').to_s.to_i
    @windspeed = @forecast.xpath('windSpeed/@mps[1]').to_s.to_i
  end

  def to_json
    {
      :time => @time,
      :symbol => @symbol,
      :precipitation => @precipitation,
      :temperature => @temperature,
      :windspeed => @windspeed
    }.to_json
  end

  protected

  def fetch_data
    if $DUMMY
      @forecast = Nokogiri::XML(open('sample.xml')).xpath('//weatherdata/forecast/tabular/time[1]')
    end
  end
end
