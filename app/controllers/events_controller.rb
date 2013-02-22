#!/bin/env ruby
# encoding: utf-8

class EventsController < ApplicationController

	def index
		@events = Event.where(date: Date.today..Date.today + 25.days)
	end

end
