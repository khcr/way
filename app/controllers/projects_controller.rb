#!/bin/env ruby
# encoding: utf-8

class ProjectsController < ApplicationController

	def index
		@projects = Project.order('updated_at')
	end

	def show
		@project = Project.find(params[:id])
	end
end