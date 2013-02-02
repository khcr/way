#!/bin/env ruby
# encoding: utf-8

class GalleriesController < ApplicationController
	before_filter :signed_in_user, only: [:admin_index, :new, :create, :edit, :update, :destroy]

	def index
		@galleries = Gallery.all
	end

	def admin_index
		@galleries = Gallery.all
		render layout: 'admin'
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	def new
		@gallery = Gallery.new
		render layout: 'admin'
	end

	def create 
		@gallery = Gallery.new(params[:gallery])
		if @gallery.save
			flash[:success] = "Gallerie crée"
			redirect_to galleries_path
		else
			render 'new', layout: 'admin'
		end
	end

	def edit
		@gallery = Gallery.find(params[:id])
		render layout: 'admin'
	end

	def update
		@gallery = Gallery.find(params[:id])
		if @gallery.update_attributes(params[:gallery])
			flash[:success] = 'Gallerie editée'
			redirect_to gallery_path(@gallery)
		else
			render 'edit', layout: 'admin'
		end
	end

	def destroy
    @gallery = Gallery.find(params[:id])
    FileUtils.rm_rf("public/uploads/image/image/#{@gallery.id}")   
    @gallery.destroy
    flash[:success] = "Gallerie supprimé"
    redirect_to galleries_path
  end
end