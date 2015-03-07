#!/bin/env ruby
# encoding: utf-8

class Admin::PagesController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, Page, nil, buttons: false)
		@table.respond
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		@page = Page.find(params[:id])
		if @page.update_attributes(page_params)
			flash[:success] = 'Page édité'
			redirect_to admin_pages_path 
		else
			render 'edit'
		end
	end

	private

	def page_params
		params.require(:page).permit(:title, :content)
	end
end
