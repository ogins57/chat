#encoding:utf-8

class UsersController < ApplicationController

    def index
        @user = User.new
    end

    def create
        @user = User.new(params[:user])
        @user[:is_valid] = 'false'
        if @user.save
           redirect_to '/'
        else
            redirect_to '/', notice: '登録処理に失敗しました。'
        end
    end
    
end
