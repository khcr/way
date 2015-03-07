#!/bin/env ruby
# encoding: utf-8

class FormsController < ApplicationController

	def new
		@form = Form.new
	end

	def create
		@form = Form.new(form_params)
		if @form.save
			flash[:success] = 'Inscription enregistrée'
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def form_params
		params.require(:form).permit(:first_name, :last_name, :phone, :notice)
	end

end
