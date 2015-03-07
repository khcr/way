#!/bin/env ruby
# encoding: utf-8

class PagesController < ApplicationController

	def home
		@presentation = Page.find_by_name('presentation')
		@news = New.where('date_exp >=?', [Time.zone.now]).order('date_exp ASC')
		@galleries = Gallery.order('date DESC').where('isprivate=?', false).limit(2)
		@next_event = Event.find_by_date(next_day(:saturday))
		@slideshows = Slideshow.where('date_exp>=?', [Time.zone.now]).order('date_exp ASC')
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

	def worship 
		@worship = Page.find_by_name('worship')
	end
end