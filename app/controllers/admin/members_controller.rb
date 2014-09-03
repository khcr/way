#!/bin/env ruby
# encoding: utf-8

class Admin::MembersController < ApplicationController
	before_filter :signed_in_admin
	layout 'admin'

	def index
		@table = Table.new(view_context, Member)
		respond_to do |format|
			format.html
			format.js { render 'shared/sort' }
		end
	end

	def new
		@member = Member.new
	end

	def create
		@member = Member.new(params[:member])
		if @member.save
			flash[:success] = "Membre ajoutée"
			redirect_to admin_members_path
		else
			render 'new'
		end
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		if @member.update_attributes(params[:member])
			flash[:success] = "Membre éditée"
			redirect_to admin_members_path
		else 
			render 'edit'
		end
	end

	def destroy
		Member.find(params[:id]).destroy
		flash[:success] = 'Membre supprimée'
		redirect_to admin_members_path
	end
end
