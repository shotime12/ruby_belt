class UsersController < ApplicationController
  def index
  end
  def login
  	if User.any?{|b| b[:email] == params[:email]} 
  		@user = User.find_by(email: params[:email])
  		if @user.authenticate(params[:pw])
  			session[:logged_in_user] = @user.id
  			redirect_to '/songs'
		else 
			flash[:pw_error] = 'Please enter the correct password'
			redirect_to '/'
		end
	else
		flash[:user_error] = "Please enter correct email"
		redirect_to '/'
	end
  end
  def register
  	@user = User.new(
  		first_name: params[:first_name],
  		last_name: params[:last_name],
  		email: params[:email],
  		password: params[:pw],
  		)
  	if @user.valid? == false
  		flash[:error] = @user.errors.messages
  		redirect_to '/'
  	else
  		if params[:pw]!=params[:confirm_pw]
  			flash[:pw_error] = "Passwords must be same"
  			redirect_to '/'
  		else
  			@user.save
  			session[:logged_in_user] = @user.id
  			redirect_to '/songs'
  		end
  	end	
  end
  def edit
  	@user = User.find(session[:logged_in_user])
  end
  def logout
    session[:logged_in_user] = nil
    redirect_to action: 'index'
  end
  def show
    @user = User.find(params[:id])
    @songlists = Songlist.where(user_id: params[:id])
  end
end
