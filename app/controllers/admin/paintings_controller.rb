#!/bin/env ruby
# encoding: utf-8

class Admin::PaintingsController < Admin::BaseController
  before_action { |c| c.authorize_level(2) }
  before_action :current_resource

  def new
    @painting = Painting.new
  end

  def create
    @painting = @gallery.paintings.new(painting_params)
    if @painting.save
    else
      render 'new'
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    FileUtils.rm_rf("public/uploads/painting/image/#{@gallery.id}/#{@painting.id}")
    @painting.destroy
    flash[:success] = "Image supprimée"
    redirect_to edit_admin_gallery_path(@gallery.id)
  end

  private 

  def painting_params
    params.require(:painting).permit(:gallery_id, :image, :name)
  end

  def current_resource
    @gallery = Gallery.find(params[:gallery_id])
  end
end
