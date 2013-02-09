#!/bin/env ruby
# encoding: utf-8

class EventsController < ApplicationController

	def index
		@events = Event.all
	end

end
