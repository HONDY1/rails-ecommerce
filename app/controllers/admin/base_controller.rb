class Admin::BaseController < ApplicationController
	layout  'admin'
	before_action :authenticate_admin!
	before_filter do 
   		 redirect_to root_path unless  current_admin
  	end
end