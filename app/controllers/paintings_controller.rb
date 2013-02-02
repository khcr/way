#!/bin/env ruby
# encoding: utf-8

class PaintingsController < ApplicationController
  layout 'admin'
  before_filter :signed_in_user

  def new
    @painting = Painting.new(:gallery_id => params[:gallery_id])
  end

  def create
    @painting = Painting.create(params[:painting])
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to paintings_url, notice: "Image supprimée"
  end

end