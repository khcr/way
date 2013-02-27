#!/bin/env ruby
# encoding: utf-8

class Admin::ImagesController < ApplicationController

	def index
		@images = Image.all
	end

	def new
	end

	def create
		@image = Image.new(params[:image])
		if @image.save
			flash[:success] = "Image téléversée"
			redirect_back_or admin_path
		else
			flash[:error] = "Erreur, vérifier le type de fichier"
			redirect_back_or admin_path
		end
	end

	def destroy
		@image = Image.find(params[:id])
		FileUtils.rm_rf("public#{@image.image}") if @image.image?
		@image.destroy
		flash[:success] = "Image supprimée"
		redirect_to admin_images_path
	end

end
