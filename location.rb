require 'json'

class Location
  attr_accessor :country, :area1, :area2

  def initialize(string)
    @string = string
  end

  def parse
    raise InvalidLocationException.new("Invalid location") if @string.nil? || @string.length == 0
    if @string =~ /^(.+),(.+),(.+)$/
      @country = $3.strip.downcase
      @area1 = $2.strip.downcase
      @area2 = $1.strip.downcase
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
end
