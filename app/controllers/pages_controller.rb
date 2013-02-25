#!/bin/env ruby
# encoding: utf-8

class PagesController < ApplicationController

	def home
		@presentation = Page.find_by_name('presentation')
		@news = New.where('created_at <=?', [Time.zone.now])
		@galleries = Gallery.limit(3)
		@next_event = Event.where('date >=?', [Time.zone.now]).order('date ASC').first
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
end