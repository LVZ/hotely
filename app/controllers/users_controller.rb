class UsersController < ApplicationController

	def new

		@user = User.new

	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to the E-Concierge Application!"
			# Handle a successful save.
			redirect_to @user
		else
			render 'new'

		end	
	end

	def show

	 @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }	

	end
end
end