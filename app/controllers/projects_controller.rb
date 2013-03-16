#!/bin/env ruby
# encoding: utf-8

class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find_by_slug!(params[:id])
	end
end