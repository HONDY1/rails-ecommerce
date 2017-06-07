class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	helper_method :current_order
	layout :layout_by_resource
	skip_before_action :verify_authenticity_token
	def current_order
		if !session[:order_id].nil?
			Order.find(session[:order_id])
		else
			Order.new
		end
	end


	private

	def layout_by_resource
		if devise_controller?
			"devise"
		else
			"application"
		end
	end
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) do |user_params|
			user_params.permit(:name, :lastname, :email, :password, :password_confirmation, :remember_me, :lastname , :birthday, :avatar)
		end
		devise_parameter_sanitizer.permit(:sign_in) do |user_params|
			user_params.permit(:email, :password)
		end
		devise_parameter_sanitizer.permit(:account_update) do |user_params|
			user_params.permit(:name, :lastname, :email, :avatar,:birthday,:password_confirmation, :remember_me, :lastname,:password, :current_password ) 

		end
	end
end
