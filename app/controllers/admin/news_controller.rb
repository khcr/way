#!/bin/env ruby
# encoding: utf-8

class Admin::NewsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, New)
		@table.respond
	end

	def new
		@new = New.new
	end

	def create
		@new = New.new(news_params)
		if @new.save
			flash[:success] = "News ajoutée"
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
		if @new.update_attributes(news_params)
			flash[:success] = "News éditée"
			redirect_to admin_news_path
		else 
			render 'edit'
		end
	end

	def destroy
		New.find(params[:id]).destroy
		flash[:success] = 'News supprimée'
		redirect_to admin_news_path
	end

	private

	def news_params
		params.require(:new).permit(:title, :content, :date_exp)
	end
end
