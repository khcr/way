#!/bin/env ruby
# encoding: utf-8

class ProjectsController < ApplicationController
	before_filter :find_page

	def show
	end

	private 
	
	def find_page
  	@project = Project.find_by_slug!(params[:id])
	end

end
