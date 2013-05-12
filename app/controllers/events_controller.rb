#!/bin/env ruby
# encoding: utf-8

class EventsController < ApplicationController

	def index
		@events = Event.where(date: Date.today..Date.today + 25.days).order("date ASC")
	end

	def show
		@event = Event.find_by_slug!(params[:id])
	end
end
