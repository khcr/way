#!/bin/env ruby
# encoding: utf-8

class GalleriesController < ApplicationController
	before_action :current_resource, only: [:show]
	before_action only: :show { |c| c.authorize_level(3) }

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
	
	def current_resource
  	@gallery = Gallery.find(params[:id])
	end

end