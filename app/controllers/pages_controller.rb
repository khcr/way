class PagesController < ApplicationController

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

	def index
		@pages = Page.all
		render layout: 'admin'
	end

	def edit
		@page = Page.find(params[:id])
		render layout: 'admin'
	end

	def update
	end
end
