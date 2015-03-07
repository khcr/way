#!/bin/env ruby
# encoding: utf-8

class Admin::SlideshowsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, Slideshow)
		@table.respond
	end

	def new
		@slideshow = Slideshow.new
	end

	def create
		@slideshow = Slideshow.new(slideshow_params)
		if @slideshow.save
			flash[:success] = "Slideshow créé"
			redirect_to admin_slideshows_path
		else
			render 'new'
		end
	end

	def edit
		@slideshow = Slideshow.find(params[:id])
	end

	def update
		@slideshow = Slideshow.find(params[:id])
		if @slideshow.image != nil && params[:image] != nil
			FileUtils.rm("public#{@slideshow.image}")
		end
		if @slideshow.update_attributes(slideshow_params)
			flash[:success] = "Slideshow édité"
			redirect_to admin_slideshows_path
		else
			render 'edit'
		end
	end

	def destroy
		@slideshow = Slideshow.find(params[:id])
		FileUtils.rm("public#{@slideshow.image}")
		@slideshow.destroy
		flash[:success] = "Slideshow supprimé"
		redirect_to admin_slideshows_path
	end

	private

	def slideshow_params
		params.require(:slideshow).permit(:date_exp, :image, :link, :name)
	end
end
