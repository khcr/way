#!/bin/env ruby
# encoding: utf-8

class SessionsController < ApplicationController
	before_action :redirect_to_profile, only: [:new]

	def new
	end

	def create
		user = User.where("lower(name) = ?", params[:session][:name].strip.downcase).first
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or profile_path, notice: "Connection réussie"
		else
			flash.now[:error] = "Mot de passe ou nom d'utilisateur incorrect."
			render 'new'
		end
	end

	def destroy 
		sign_out
		redirect_to root_path, notice: "Déconnection réussie"
	end

	private

	def redirect_to_profile
		redirect_to profile_path if signed_in?
	end
end
