#!/bin/env ruby
# encoding: utf-8

class Admin::GalleriesController < Admin::BaseController¨
  before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, Gallery)
    @table.respond
	end

	def new
		@gallery = Gallery.new
	end

	def create 
		@gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:success] = "Galerie crée"
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
    if @gallery.update_attributes(gallery_params)
      flash[:success] = "Galerie modifiée"
      redirect_to edit_admin_gallery_path(@gallery.id)
    else
      render 'edit'
    end
	end

	def destroy
		@gallery = Gallery.find(params[:id])
    FileUtils.rm_rf("public/uploads/painting/image/#{@gallery.id}")   
    @gallery.destroy
    flash[:success] = "Galerie supprimée"
    redirect_to admin_galleries_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :description, :isprivate, :date)
  end
end