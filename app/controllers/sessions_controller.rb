class SessionsController < ApplicationController

	def new
	end

	def create
		if request.env['omniauth.auth']
			user = User.find_or_create_from_auth_has(request.env['omniauth.auth'])
			session[:user_id] = user.id
			if user.valid?
				auto_login user
				redirect_back_or_to current_user
			else
				render :new
			end
		else
			email = params[:session][:email]
			password = params[:session][:password]

	   		if login email, password
				redirect_back_or_to current_user, notice: "Welcome, #{current_user.name}"
			else
				flash.now[:error] = "Wrong password/username"
				render :new
			end
		end
	end

	def destroy
		session[:user_id] = nil
		logout
		redirect_to root_url
	end

end
