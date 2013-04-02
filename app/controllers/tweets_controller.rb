class TweetsController < ApplicationController

	def index
		@tweets = Tweet.all(:order =>'created_at DESC')
		@tweet = Tweet.new
	end

	def new
		@tweet = Tweet.new
	end
	
	def create
		@tweet = Tweet.new(params[:tweet])
		@tweet.save
        render json: { tweet: @tweet }
    end
end
