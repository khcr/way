#!/bin/env ruby
# encoding: utf-8

class Admin::ImagesController < ApplicationController

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

end
