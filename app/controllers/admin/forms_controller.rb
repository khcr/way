#!/bin/env ruby
# encoding: utf-8

class Admin::FormsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, Form, nil, buttons: false)
		@table.respond
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
