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

  def  Kelvin_to_degree_celcius(temp)
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
          Temprature in F/C #{Kelvin_to_degree_celcius(main_weather["temp"])}C\n
          <<<<-------------------------------------------->>>>\n
          Minimum Temprature #{Kelvin_to_degree_celcius(main_weather["temp_min"])}C\n
          <<<<-------------------------------------------->>>>\n
          Maximum Temprature #{Kelvin_to_degree_celcius(main_weather["temp_max"])}C\n
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
      exit
    end

    case response.code
      when 200
        true
      when 404
        puts "Requested data not found"
        exit
      when 500...600
        puts "Server Side error #{response.code}"
        exit
  end
  end
end

class WeatherApp
  include ProcessResponse

  include ErorrHandlingModule

  def initialize(city_name)
    getcitylocation = HTTParty.get("https://api.openweathermap.org/geo/1.0/direct?q=#{city_name}&limit=5&appid=bc4f338f7cac50913f5c4d2f183b6876")
    if request_to_api_success?(getcitylocation)
      lat,lon = get_lat_and_lon(getcitylocation)

      @response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=bc4f338f7cac50913f5c4d2f183b6876")
      request_to_api_success?(@response)
    end

  end

  def todays_weather
    request_to_api_success?(@response)
    get_todays_weather_info(@response)
  end
end

pattern = WeatherApp.new("Pune")
pattern.todays_weather
