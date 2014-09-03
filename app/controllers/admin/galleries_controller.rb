#!/bin/env ruby
# encoding: utf-8

class Admin::GalleriesController < ApplicationController
	before_filter :signed_in_admin
	layout 'admin'

	def index
		@table = Table.new(view_context, Gallery)
		respond_to do |format|
			format.html
			format.js { render 'shared/sort' }
		end
	end

	def new
		@gallery = Gallery.new
	end

	def create 
		@gallery = Gallery.new(params[:gallery])
    if @gallery.save
      flash[:success] = "Gallerie crée"
      redirect_to edit_admin_gallery_path(@gallery.id)
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
      flash[:success] = "Gallerie modifiée"
      redirect_to edit_admin_gallery_path(@gallery.id)
    else
      render 'edit'
    end
	end

	def destroy
		@gallery = Gallery.find(params[:id])
    FileUtils.rm_rf("public/uploads/painting/image/#{@gallery.id}")   
    @gallery.destroy
    flash[:success] = "Gallerie supprimée"
    redirect_to admin_galleries_path
  end
end