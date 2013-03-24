#!/bin/env ruby
# encoding: utf-8

class Admin::EventsController < ApplicationController
	before_filter :signed_in_admin
	layout 'admin'

	def index
		@events = Event.page(params[:page]).order('date DESC').per_page(10)
	end

	def new 
		@event = Event.new
	end

	def create
		params[:event].delete(:slug) if params[:event][:slug].blank?
		@event = Event.new(params[:event])
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
		params[:event].delete(:slug) if params[:event][:slug].blank?
		@event = Event.find(params[:id])
		if @event.update_attributes(params[:event])
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
end
