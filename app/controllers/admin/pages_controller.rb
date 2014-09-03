#!/bin/env ruby
# encoding: utf-8

class Admin::PagesController < ApplicationController
	before_filter :signed_in_admin
	layout 'admin'

	def index
		@table = Table.new(view_context, Page)
		respond_to do |format|
			format.html
			format.js { render 'shared/sort' }
		end
	end

	def admin_index
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		@page = Page.find(params[:id])
		if @page.update_attributes(params[:page])
			flash[:success] = 'Contenu édité'
			redirect_to admin_pages_path 
		else
			render 'edit'
		end
	end
end
