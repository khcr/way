#!/bin/env ruby
# encoding: utf-8

class Admin::UsersController < Admin::BaseController
	before_action except: [:edit, :update, :profile] { |c| c.authorize_level(1) }
	before_action :signed_in, only: [:profile]
	before_action :correct_user, only: [:edit, :update]

	def index
		@table = Table.new(self, User)
		@table.respond
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Utilisateur ajouté"
			redirect_to admin_users_path
		else
			render 'new'
		end
	end

	def edit 
		@user = User.find(params[:id])
	end

	def update 
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile enregistré"
			sign_in @user
			redirect_to edit_admin_user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "Utilisateur supprimé"
		redirect_to admin_users_path
	end

	def profile
	end

	private

	def correct_user
  	@user = User.find(params[:id])
  	unless (current_user && current_user?(@user) && authorize_level?(2)) || authorize_level?(1)
    	redirect_to profile_path
    end
  end

  def signed_in
  	redirect_to login_path, error: "Veuillez vous connecter" unless signed_in?
  end

end
