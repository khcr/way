#!/bin/env ruby
# encoding: utf-8

class Admin::GalleriesController < ApplicationController
	before_filter :signed_in_user
	#before_filter :find_page, only: [:edit, :update, :destroy]
	layout 'admin'

	def index
		@galleries = Gallery.page(params[:page]).per_page(10)
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
		
    if @gallery.update_attributes(params[:gallery])
      flash[:success] = "Gallerie modifiée"
      redirect_to edit_admin_gallery_path(@gallery)
    else
      render 'edit'
    end
	end

	def destroy
    
    FileUtils.rm_rf("public/uploads/painting/image/#{@gallery.id}")   
    @gallery.destroy
    flash[:success] = "Gallerie supprimée"
    redirect_to admin_galleries_path
  end

  # private

	# def find_page
  # 	@gallery = Gallery.find_by_slug!(params[:id])
	# end
end