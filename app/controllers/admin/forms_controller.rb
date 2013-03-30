#!/bin/env ruby
# encoding: utf-8

class Admin::FormsController < ApplicationController
	before_filter :signed_in_admin
	layout 'admin'

	def index
		@forms = Form.page(params[:page]).per_page(10)
	end

	def destroy
		Form.find(params[:id]).destroy
		flash[:success] = 'Inscription supprimée'
		redirect_to admin_forms_path
	end
end
