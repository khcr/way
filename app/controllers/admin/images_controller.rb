#!/bin/env ruby
# encoding: utf-8

class Admin::ImagesController < ApplicationController
	before_filter :signed_in_admin
	layout 'admin'

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
		Event.where('image_id = ?', @image.id).each do |event|
			event.image_id = ""
			event.save
		end
		FileUtils.rm("public#{@image.image}")
		@image.destroy
		flash[:success] = "Image supprimée"
		redirect_to admin_images_path
	end

end
