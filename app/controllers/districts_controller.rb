class DistrictsController < ApplicationController
	def index
		@districts = District.all
	end
	def show
		@district = District.find(params[:id])
	end

	def new
		#For select option	
		@province_option = Province.all.map{|p| [p.name, p.id]}
		
		@district = District.new
	end

	def edit
		#For select option	
		@province_option = Province.all.map{|p| [p.name, p.id]}

		@district = District.find(params[:id])		
	end

	def create
		
		#render plain: params[:district].inspect

		@district = District.new(district_params)
		if @district.save
			redirect_to @district
		else
			render 'new'
		end		
	end

	def update
		@district = District.find(params[:id])
		if @district.update(district_params)
			redirect_to @district
		else
			render 'edit'
		end
	end
	def destroy
		@district = District.find(params[:id])
		@district.destroy

		redirect_to districts_path		
	end

	private
		def district_params
			params.require(:district).permit(:dis_name, :note, :province_id)			
		end
end
