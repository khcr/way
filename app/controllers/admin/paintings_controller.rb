#!/bin/env ruby
# encoding: utf-8

class Admin::PaintingsController < ApplicationController
  before_filter :signed_in_user
  layout 'admin'

  def index
    @paintings = Painting.page(params[:page]).per_page(10)
  end

  def new
    @painting = Painting.new(:gallery_id => params[:gallery_id])
  end

  def create
    @painting = Painting.create(params[:painting])
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to admin_galleries_url, notice: "Image supprimée"
  end

end
