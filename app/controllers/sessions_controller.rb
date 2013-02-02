#!/bin/env ruby
# encoding: utf-8

class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_name(params[:session][:name])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to admin_path
		else
			flash.now[:error] = "Pseudo ou mot de passe incorrect"
			render 'new'
		end
	end

	def destroy 
		sign_out
		redirect_to root_path
	end
end
