#!/bin/env ruby
# encoding: utf-8

class Admin::NewsController < ApplicationController
	before_filter :signed_in_user
	layout 'admin'

	def index
		@news = New.page(params[:page]).per_page(10)
	end

	def new
		@new = New.new
	end

	def create
		@new = New.new(params[:new])
		if @new.save
			flash[:success] = "New ajoutée"
			redirect_to admin_news_path
		else
			render 'new'
		end
	end

	def edit
		@new = New.find(params[:id])
	end

	def update
		@new = New.find(params[:id])
		if @new.save_attributes(params[:new])
			flash[:success] = "New éditée"
			redirect_to admin_news_path
		else 
			render 'edit'
		end
	end

	def destroy
		New.find(params[:id]).destroy
		flash[:success] = 'New supprimmée'
		redirect_to admin_news_path
	end
end
