#!/bin/env ruby
# encoding: utf-8

class ProjectsController < ApplicationController

	def show
		@project = Project.find(params[:id])
	end

end
