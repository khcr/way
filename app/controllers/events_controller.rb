#!/bin/env ruby
# encoding: utf-8

class EventsController < ApplicationController
	before_filter :signed_in_user, only: [:admin_index, :new, :create, :edit, :update, :destroy]

	def index
		@events = Event.all
	end

	def admin_index
		@events = Event.all
		render layout: 'admin'
	end

	def new 
		@event = Event.new
		render layout: 'admin'
	end

	def create
		@event = Event.new(params[:event])
		if @event.save
			flash[:success] = "Evénement ajouté"
			redirect_to programme_path
		else
			render 'new', layout: 'admin'
		end
	end

	def edit
		@event = Event.find(params[:id])
		render layout: 'admin'
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(params[:event])
			flash[:success] = "Evénement édité"
			redirect_to programme_path
		else
			render 'edit', layout: 'admin'
		end
	end

	def destroy 
		Event.find(params[:id]).destroy
		flash[:success] = "Evénement supprimé"
		redirect_to admin_programme_path
	end
end
