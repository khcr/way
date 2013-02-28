#!/bin/env ruby
# encoding: utf-8

class GalleriesController < ApplicationController
	before_filter :find_page, only: [:show]

	def index
		@galleries = Gallery.all
	end

	def show
	end

	private 
	
	def find_page
  	@gallery = Gallery.find_by_slug!(params[:id])
	end
end