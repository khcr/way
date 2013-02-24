#!/bin/env ruby
# encoding: utf-8

class GalleriesController < ApplicationController

	def index
		@galleries = Gallery.all
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

end