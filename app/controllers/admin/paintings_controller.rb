#!/bin/env ruby
# encoding: utf-8

class Admin::PaintingsController < ApplicationController
  before_filter :signed_in_admin
  before_filter :gallery
  layout 'admin'

  def new
    @painting = Painting.new
  end

  def create
    @painting = @gallery.paintings.new(params[:painting])
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

  def gallery
    @gallery = Gallery.find(params["gallery_id"])
  end
end
