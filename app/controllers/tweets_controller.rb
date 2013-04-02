class TweetsController < ApplicationController

	def index
		@tweets = Tweet.all(:order =>'created_at DESC')
		@tweet = Tweet.new
	end

	def new
		@tweet = Tweet.new
	end
	
	def create
		@tweet = Tweet.new(params[:id])
		if @tweet.save
			redirect_to tweets_path
		else
			render action: 'new'
		end
	end
end
