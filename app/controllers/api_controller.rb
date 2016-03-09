class ApiController < ApplicationController

	skip_before_action :verify_authenticity_token, :authenticate_user!

private
	def authenticated?
		authenticate_or_request_with_http_basic do |email, password|
			@current_user = User.find_by(email: email)
			begin
				@current_user.valid_password?(password)
			rescue
				render json: {success: false, message: "Authentication Failed"}, status: 401
			end
		end
	end
end
