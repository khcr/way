#!/bin/env ruby
# encoding: utf-8

class EventsController < ApplicationController

	def index
    date = next_day(:saturday)
    @dates = { date => nil }
    3.times do 
      date = next_day(:saturday, date.next_day)
      @dates[date] = nil 
    end

    Event.where(date: Date.today..Date.today.next_month).order(:date).each do |event|
      if event.remove
        @dates.reject! { |k| k == event.date }
      else
        @dates[event.date] = event
      end
    end

    @dates.sort.to_h
	end

	def show
		@event = Event.find(params[:id])
	end
end
