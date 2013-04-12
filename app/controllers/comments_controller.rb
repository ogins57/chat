class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        #@comment = Post.find(params[:post_id]).comments.create(params[:comment])
        @comment = Post.find(params[:post_id]).comments.new(params[:comment])
        if @comment.save
            redirect_to post_path(@post)
        else
            render :template => "posts/show"
        end
    end


    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: {comment: @comment}
    end

    def create
        @tweet = Tweet.find(params[:tweet_id])
        @comment = Tweet.find(params[:tweet_id]).comments.new(params[:comment])
        if @comment.save
            redirect_to tweet_path(@tweet)
        else
            render :template => "tweets"
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: {comment: @comment}
    end

end
