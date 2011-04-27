require 'json'
require 'open-uri'
require 'nokogiri'

class Location
  attr_accessor :country, :area1, :area2

  def initialize(string)
    @string = string
  end

  def parse
    if @string =~ /^(.+),(.+),(.+)$/
      @country = $3.strip.downcase
      @area1 = $2.strip.downcase
      @area2 = $1.strip.downcase
    elsif @string =~ /^([-+]?[0-9]+\.[0-9]+\s*,\s*[-+]?[0-9]+\.[0-9]+)$/
      @country, @area1, @area2 = fetch_from_geo($1)
    else
      raise InvalidLocationException.new("Invalid location `#{@string}'")
    end
  end

  def to_json
    {
      :country => @country,
      :area1 => @area1,
      :area2 => @area2
    }.to_json
  end

  class InvalidLocationException < Exception
  end

  protected

  def fetch_from_geo(geo)
    doc = if $DUMMY
      Nokogiri::XML(open('geo.xml'))
    else
      Nokogiri::XML(open("http://maps.googleapis.com/maps/api/geocode/xml?address=#{geo}&sensor=true"))
    end

    result = doc.xpath('//GeocodeResponse/result')

    country = result.xpath('address_component[type="country"]/long_name/text()').to_s
    area1 = result.xpath('address_component[type="administrative_area_level_1"]/long_name/text()').to_s
    area2 = result.xpath('address_component[type="administrative_area_level_2"]/long_name/text()').to_s

    return country, area1, area2
  end
end
