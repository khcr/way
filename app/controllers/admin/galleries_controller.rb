#!/bin/env ruby
# encoding: utf-8

class Admin::GalleriesController < ApplicationController
	before_filter :signed_in_user
	layout 'admin'

	def index
		@galleries = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def create 
		@gallery = Gallery.new(params[:gallery])
		if @gallery.save
			flash[:success] = "Gallerie crée"
			redirect_to edit_admin_gallery_path(@gallery)
		else
			render 'new'
		end
	end

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def update
		@gallery = Gallery.find(params[:id])
		if @gallery.update_attributes(params[:gallery])
			flash[:success] = 'Gallerie editée'
			redirect_to gallery_path(@gallery)
		else
			render 'edit'
		end
	end

	def destroy
    @gallery = Gallery.find(params[:id])
    FileUtils.rm_rf("public/uploads/image/image/#{@gallery.id}")   
    @gallery.destroy
    flash[:success] = "Gallerie supprimé"
    redirect_to admin_galleries_path
  end

end
