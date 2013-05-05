#encoding:utf-8
class TweetsController < ApplicationController

	def index
		@tweets = Tweet.all(:order =>'created_at DESC')
        @new_tweet = Tweet.new
        _user = session[:user]
        _user_name = _user[:lastname] + ' ' + _user[:firstname]
        @new_tweet.user = _user_name
        @comment = Comment.new
        @comment.user = _user_name
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
            redirect_to tweets_path, notice: '「' + @tweet.user +
                '」さん のつぶやきがねつ造されました。'
            else
            render action: 'edit'
        end
    end
end
