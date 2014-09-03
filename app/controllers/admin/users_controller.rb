#!/bin/env ruby
# encoding: utf-8

class Admin::UsersController < ApplicationController
	layout 'admin'
	before_filter :signed_in_superadmin, except: [:edit, :update]
	before_filter :correct_user, only: [:edit, :update]

	def index
		@table = Table.new(view_context, User)
		respond_to do |format|
			format.html
			format.js { render 'shared/sort' }
		end
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

	private

	def correct_user
  	@user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
