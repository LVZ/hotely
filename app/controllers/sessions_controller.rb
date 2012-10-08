class SessionsController < ApplicationController

	def new
	end

	def create
		email = params[:session][:email]
		password = params[:session][:password]
		##logger.debug email
		##logger.debug password

		user = User.find_by_email(params[:session][:email].downcase)

   		if login email: email, password: password
   			   # Sign the user in and redirect to the user's show page.
   			sign_in user   
			redirect_to root_path, notice: "You've logged in, #{current_user.name}"
		else
			flash.now[:error] = "Wrong password/username"
			render :new 	
		end	
	end

	def destroy
		sign_out
		redirect_to root_url
	end	
end
