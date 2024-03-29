require 'rubygems'
require 'httparty'
require 'date'

module ProcessResponse
  def get_lat_and_lon(response)
    if(response.length == 0)
      exit
    end
    return response[0]["lat"],response[0]["lon"]
  end

  def  kelvin_to_degree_celcius(temp)
    return (temp - 273.15).round(2)
  end

  def get_todays_weather_info(response)
    condition_weather = response["weather"][0]["main"]
    main_weather = response["main"]
    sys_weather = response["sys"]
    division_weather =response["name"]
    dt_weather = response["dt"]
    print "
          Below Data Provided comes under #{division_weather} Division
          <<<<-------------------------------------------->>>>\n
          #{condition_weather} Weather\n
          <<<<-------------------------------------------->>>>\n
          Temprature in /C #{kelvin_to_degree_celcius(main_weather["temp"])}C\n
          <<<<-------------------------------------------->>>>\n
          Minimum Temprature #{kelvin_to_degree_celcius(main_weather["temp_min"])}C\n
          <<<<-------------------------------------------->>>>\n
          Maximum Temprature #{kelvin_to_degree_celcius(main_weather["temp_max"])}C\n
          <<<<-------------------------------------------->>>>\n
          Pressure #{main_weather["pressure"]}\n
          <<<<-------------------------------------------->>>>\n
          Humidity #{main_weather["humidity"]}\n
          <<<<-------------------------------------------->>>>\n
          Country #{sys_weather["country"]} Date #{Time.at(dt_weather.to_i).to_datetime}\n
          <<<<-------------------------------------------->>>>\n
    "
  end
end

module ErorrHandlingModule
  def request_to_api_success?(response)

    if(response == nil || response.length == 0)
      puts "There might be you have entered wrong city name!!!"
      raise "Exception Created for having response #{response}"
    end

    case response.code
      when 200
        true
      when 404
        puts "Requested data not found"
        raise " Not found #{response.code}"
      when 500...600
        puts "Server Side error #{response.code}"
        raise "Server Side error #{response.code}"
    end
  end
end

class WeatherApp
  include ProcessResponse

  include ErorrHandlingModule

  def initialize(city_name)

    validate_city_name(city_name)
    begin
    getcitylocation = HTTParty.get("https://api.openweathermap.org/geo/1.0/direct?q=#{city_name}&limit=5&appid=bc4f338f7cac50913f5c4d2f183b6876")
    if request_to_api_success?(getcitylocation)
      lat,lon = get_lat_and_lon(getcitylocation)

      @response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=bc4f338f7cac50913f5c4d2f183b6876")
      request_to_api_success?(@response)
    end
    rescue
      raise "Exception raised api call failed"
    end

  end

  def todays_weather
    request_to_api_success?(@response)
    get_todays_weather_info(@response)
  end

  private

  def validate_city_name(city_name)
    if city_name =~ /^[a-zA-Z\s-]+$/
    else
      raise "Exception Created Invalid city name: #{city_name}"
    end
  end
end


print("Enter City name:")
city_name = gets.chomp

pattern = WeatherApp.new(city_name)
pattern.todays_weather
