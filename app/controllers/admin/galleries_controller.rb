#!/bin/env ruby
# encoding: utf-8

class Admin::GalleriesController < ApplicationController
	before_filter :signed_in_user
	layout 'admin'

	def index
		@galleries = Gallery.page(params[:page]).per_page(10)
	end

	def new
		@gallery = Gallery.new

		respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
	end

	def create 
		@gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to galleries_url, notice: 'Gallerie crée' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def update
		@gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to galleries_url , notice: 'Gallerie édité' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
    @gallery = Gallery.find(params[:id])
    FileUtils.rm_rf("public/uploads/image/image/#{@gallery.id}")   
    @gallery.destroy
    flash[:success] = "Gallerie supprimé"

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
  	end
  end
end