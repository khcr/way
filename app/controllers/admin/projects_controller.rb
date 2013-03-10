#!/bin/env ruby
# encoding: utf-8

class Admin::ProjectsController < ApplicationController
	before_filter :signed_in_admin
  layout 'admin'

	def index
		@projects = Project.page(params[:page]).per_page(10)
	end

	def new
		@project = Project.new
	end

	def create 
		@project = Project.new(params[:project])
		if @project.save
			flash[:success] = "Projet créé"
			redirect_to project_path(@project.id)
		else
			render 'new'
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
			flash[:success] = "Projet édité "
			redirect_to edit_admin_project_path(@project.id)
		else
			render 'edit'
		end
	end

	def destroy 
		Project.find(params[:id]).destroy
		flash[:success] = "Projet supprimé"
		redirect_to admin_projects_path
	end

	def mercury_update
  	project = Project.find(params[:id])
  	project.name = params[:content][:project_name][:value]
  	project.content = params[:content][:project_content][:value]
  	project.save!
 	 	render text: ""
	end
end
