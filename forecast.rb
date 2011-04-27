require 'date'
require 'open-uri'
require 'nokogiri'

class Forecast
  ENDPOINT = "http://www.yr.no/place"

  attr_reader :location, :time, :symbol, :precipitation, :temperature, :windspeed, :attribution

  def initialize(location)
    @location = location
  end

  def fetch
    fetch_data
    parse_attribution
    parse_forecast
  end

  def parse_forecast
    forecast = @doc.xpath('//weatherdata/forecast/tabular/time[1]')

    @time = DateTime.parse(forecast.xpath('@from[1]').to_s)
    @symbol = forecast.xpath('symbol/@name[1]').to_s.downcase
    @precipitation = forecast.xpath('precipitation/@value[1]').to_s.to_i
    @temperature = forecast.xpath('temperature[@unit="celsius"]/@value[1]').to_s.to_i
    @windspeed = forecast.xpath('windSpeed/@mps[1]').to_s.to_i
  end

  def parse_attribution
    attribution = @doc.xpath('//weatherdata/credit/link[1]')
    @attribution = {
      :text => attribution.xpath('@text[1]').to_s,
      :link => attribution.xpath('@url[1]').to_s
    }
  end

  def to_json
    {
      :attribution => @attribution,
      :time => @time,
      :symbol => @symbol,
      :precipitation => @precipitation,
      :temperature => @temperature,
      :windspeed => @windspeed
    }.to_json
  end

  protected

  def fetch_data
    @doc = if $DUMMY
      Nokogiri::XML(open('sample.xml'))
    else
      Nokogiri::XML(open(url_for_location(@location)))
    end
  end

  def url_for_location(location)
    "#{ENDPOINT}/#{location.country}/#{location.area1}/#{location.area2}/forecast.xml".gsub(' ', '%20')
  end
end
