#!/bin/env ruby
# encoding: utf-8

class Admin::EventsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@events = Event.order('date DESC')
		@table = Table.new(self, Event, @events)
		@table.respond
	end

	def new 
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:success] = "Evénement ajouté"
			redirect_to admin_events_path
		else
			render 'new'
		end
	end

	def edit
		@event = Event.find(params[:id])
	end 

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			flash[:success] = "Evénement édité"
			redirect_to admin_events_path
		else
			render 'edit'
		end
	end

	def destroy 
		Event.find(params[:id]).destroy
		flash[:success] = "Evénement supprimé"
		redirect_to admin_events_path
	end

	private

	def event_params
		params.require(:event).permit(:content, :date, :remove, :replace)
	end
end
