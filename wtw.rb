class Wtw
  attr_reader :forecast, :brolly, :shades, :shorts, :scarf

  def initialize(forecast)
    @forecast = forecast
    @brolly = forecast.precipitation > 0 || forecast.symbol.include?('rain')
    @shades = forecast.symbol.include?('fair') || forecast.symbol.include?('partly cloudy')
    @shorts = (forecast.temperature >= 16 && forecast.windspeed <= 5) || forecast.temperature > 22
    @scarf = (forecast.temperature < 10 && forecast.windspeed >= 5) || forecast.temperature < 5
  end

  def to_json
    {
      :time => @forecast.time,
      :brolly => @brolly,
      :shades => @shades,
      :shorts => @shorts,
      :scarf => @scarf
    }.to_json
  end
end
