#!/bin/env ruby
# encoding: utf-8

class Admin::FormsController < ApplicationController
	before_filter :signed_in_admin
	layout 'admin'

	def index
		@table = Table.new(view_context, Form, nil, buttons: false)
		respond_to do |format|
			format.html
			format.js { render 'shared/sort' }
		end
	end

	def reset
		Form.destroy_all
		flash[:success] = 'Inscriptions réinitialisées'
		redirect_to admin_forms_path
	end

	def destroy
		Form.find(params[:id]).destroy
		flash[:success] = 'Inscription supprimée'
		redirect_to admin_forms_path
	end
end
