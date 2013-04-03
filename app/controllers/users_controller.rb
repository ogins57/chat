class UsersController < ApplicationController

	def index
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
            session[:user] = @user
			redirect_to '/tweets'
		else
			render action: 'new'
		end
	end
end
