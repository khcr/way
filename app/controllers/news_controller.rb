#!/bin/env ruby
# encoding: utf-8

class NewsController < ApplicationController
	layout 'admin'

	def index
		@news = New.all
	end

	def new
		@new = New.new
	end

	def create
		@new = New.new(params[:new])
		if @new.save
			flash[:success] = "New ajoutée"
			redirect_to news_path
		else
			render 'new'
		end
	end

	def edit
		@new = New.find(params[:id])
	end

	def update
	end

	def destroy
		New.find(params[:id]).destroy
		flash[:success] = 'New supprimmée'
		redirect_to news_path
	end
end
