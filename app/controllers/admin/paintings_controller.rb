#!/bin/env ruby
# encoding: utf-8

class Admin::PaintingsController < ApplicationController
  before_filter :signed_in_user
  before_filter :gallery
  layout 'admin'

  def new
    @painting = Painting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @painting }
    end
  end

  def create
    @painting = @gallery.paintings.new(params[:painting])
    if @painting.save

    else
      render :json => { "errors" => @painting.errors } 
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy

    respond_to do |format|
      format.html { redirect_to admin_gallery_path(@gallery) }
      format.json { head :no_content }
    end
  end

  private 

  def gallery
    @gallery = Gallery.find(params["gallery_id"])
  end
end
