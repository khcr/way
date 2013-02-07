#!/bin/env ruby
# encoding: utf-8

class ProjectsController < ApplicationController
	before_filter :signed_in_user, except: [:show]

	def show
		@project = Project.find(params[:id])
	end

	def admin_index
		@projects = Project.all
		render layout: 'admin'
	end

	def new
		@project = Project.new
		render layout: 'admin'
	end

	def create 
		@project = Project.new(params[:project])
		if @project.save
			flash[:success] = "Projet créé"
			redirect_to project_path(@project)
		else
			render 'new', layout: 'admin'
		end
	end

	def edit
		@project = Project.find(params[:id])
		render layout: 'admin'
	end

	def update
		@project = Project.find(params[:id])
		if @project.save_attributes(params[:project])
			flash[:success] = "Projet édité "
			redirect_to project_path(@project)
		else
			render 'edit', layout: 'admin'
		end
	end

	def destroy 
		Project.find(params[:id]).destroy
		flash[:success] = "Projet supprimé"
		redirect_to projets_path
	end

end
