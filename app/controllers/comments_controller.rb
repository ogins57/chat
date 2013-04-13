class CommentsController < ApplicationController

    def create
        print session[:user].name
        @tweet = Tweet.find(params[:tweet_id])
        @comment = Tweet.find(params[:tweet_id]).comments.create(params[:comment])
        @comment.user = @tweet.user
        redirect_to tweets_path(@tweet)
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: {comment: @comment}
    end

end
