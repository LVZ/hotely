class UsersController < ApplicationController
	before_filter :require_login, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]

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

	def edit
	end

	def update
  	if @user.update_attributes(params[:user])
  		flash[:success] = "Profile updated"
    		# Handle a successful update.
    		sign_in @user
    		redirect_to @user
  	else
    		render 'edit'
    end
  end

    private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user == @user
  end

  def admin_user
  	redirect_to(root_path) unless current_user.admin?
  end
end
