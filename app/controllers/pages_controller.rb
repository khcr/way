#!/bin/env ruby
# encoding: utf-8

class PagesController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :admin_index, :update]

	def home
		@presentation = Page.find_by_name('presentation')
		@news = New.all
	end

	def vision
		@vision = Page.find_by_name('vision')
	end

	def links
		@links = Page.find_by_name('links')
	end

	def contact 
		@contact = Page.find_by_name('contact')
	end

	def index
		@pages = Page.all
		render layout: 'admin'
	end

	def admin_index
		render layout: 'admin'
	end

	def edit
		@page = Page.find(params[:id])
		render layout: 'admin'
	end

	def update
		@page = Page.find(params[:id])
		if @page.update_attributes(params[:page])
			flash[:success] = 'Contenu édité'
			redirect_to pages_path 
		else
			render 'edit', layout: 'admin'
		end
	end
end