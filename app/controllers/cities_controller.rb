class CitiesController < ApplicationController
	def view
		@all_cities = City.all
	end

	def new
		@city = City.new
	end

	def create
		@city = City.new(params)
		@city.save
		redirect_to :action => 'view'
end

	def update
		#@city = City.all[params[:name]]
		#@city.update(params)
		#redirect_to :action => 'view'
		if params[:name]
			city_name = City.all[params[:name].to_sym]
			if city_name
				city_name.update(params)
			else
			end
			redirect_to :action => 'view'
		end
	end
end
