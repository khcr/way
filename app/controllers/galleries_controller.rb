#!/bin/env ruby
# encoding: utf-8

class GalleriesController < ApplicationController
	before_filter :find_page, only: [:show]

	def index
		@galleries = Gallery.order('date DESC').where('isprivate = ?', false).page(params[:page]).per_page(8)
	end

	def show
	end

	# log with key
	def create
		@gallery = Gallery.find(params[:gallery][:id])
		if @gallery.key == params[:gallery][:key]
			render 'show'
		else
			flash.now[:error] = "Clef incorrect."
			render 'auth'
		end
	end

	def auth
		@gallery = Gallery.find(params[:id])
	end

	private 
	
	def find_page
  	@gallery = Gallery.find_by_slug!(params[:id])
  	signed_in_gallery(@gallery) if @gallery.isprivate
	end

end