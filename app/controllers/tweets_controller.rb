#encoding:utf-8
class TweetsController < ApplicationController

	def index
		@tweets = Tweet.all(:order =>'created_at DESC')
        @new_tweet = Tweet.new
        @new_tweet.user = session[:user].name
	end

	def new
		@tweet = Tweet.new
	end
	
	def create
		@new_tweet = Tweet.new(params[:tweet])
		@new_tweet.save
        #render json: { tweet: @new_tweet }
        redirect_to tweets_path
    end
    
    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        render json: { tweet: @tweet }
    end

    def show
        @tweet = Tweet.find(params[:id])
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update_attributes(params[:tweet])
            redirect_to tweets_path, notice: 'ねつ造しました。'
            else
            render action: 'edit'
        end
    end
end
