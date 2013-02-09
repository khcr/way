#!/bin/env ruby
# encoding: utf-8

class GalleriesController < ApplicationController
<<<<<<< HEAD
=======
	before_filter :signed_in_user, only: [:admin_index, :new, :create, :edit, :update, :destroy]
	include SessionsHelper
>>>>>>> e5eee438a9dfedff2da87e2111e6de2c53af51e7

	def index
		@galleries = Gallery.all
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

end