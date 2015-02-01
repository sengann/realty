class ProvincesController < ApplicationController

	def index
		@provinces = Province.all
	end
	def show
		@province =Province.find(params[:id])
	end

	def new
		@province = Province.new
	end
	def edit
		@province = Province.find(params[:id])		
	end

	def create
		@province = Province.new(province_params)

		if @province.save
			redirect_to @province
		else
			render 'new'
		end
	end

	def update
		@province = Province.find(params[:id])
		if @province.update(province_params)
			redirect_to @province
		else
			render 'edit'
		end
	end
	def destroy
		@province = Province.find(params[:id])
		@province.destroy

		redirect_to provinces_path		
	end

	private
		def province_params
			params.require(:province).permit(:name)			
		end
end
