#!/bin/env ruby
# encoding: utf-8

class GalleriesController < ApplicationController

	def index
		@galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
	end

	def show
		@gallery = Gallery.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
	end

end