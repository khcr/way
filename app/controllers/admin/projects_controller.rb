#!/bin/env ruby
# encoding: utf-8

class Admin::ProjectsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, Project)
		@table.respond
	end

	def new
		@project = Project.new
	end

	def create 
		@project = Project.new(project_params)
		if @project.save
			flash[:success] = "Projet créé"
			redirect_to admin_projects_path
		else
			render 'new'
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
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

	def project_params
		params.require(:project).permit(:name, :content)
	end
end
