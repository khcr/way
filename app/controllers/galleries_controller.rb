#!/bin/env ruby
# encoding: utf-8

class GalleriesController < ApplicationController
	before_action :authorize_gallery, only: :show

	def index
		@galleries = if !authorize_level?(3)
			Gallery.where(isprivate: false)
		else
			Gallery.all
		end.order('date DESC').paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	private 
	
	def authorize_gallery
		@gallery = Gallery.find(params[:id])
		if @gallery && @gallery.isprivate && !authorize_level?(3)
			flash[:error] = "Pas autorisé"
			redirect_to login_path
		end
	end

end