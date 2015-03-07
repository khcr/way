#!/bin/env ruby
# encoding: utf-8

class Admin::ImagesController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@images = Image.all
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		if @image.save
			flash[:success] = "Image téléversée"
			redirect_back_or admin_images_path
		else
			flash[:error] = "Erreur, vérifier le type de fichier"
			redirect_back_or admin_images_path
		end
	end

	def destroy
		@image = Image.find(params[:id])
		FileUtils.rm("public#{@image.image}")
		@image.destroy
		flash[:success] = "Image supprimée"
		redirect_to admin_images_path
	end

	private

	def image_params
		params.require(:image).permit(:image)
	end

end
