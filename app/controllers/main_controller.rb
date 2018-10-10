require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
    @w = WeatherService.get(params[:city])
    if @w 
    	@temperature = (9 / 5) * (@w[:temperature] - 273) + 32
    	# Create a new city
    	city = City.new(
			name: params[:city],
			description: @w[:description],
			temperature: @temperature #using the converted temperature from above
  		)
    	# Save the city so that it's in City.all
    	city.save
    end
  end
end
