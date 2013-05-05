#encoding:utf-8

class LoginController < ApplicationController

    def index
       @login_user = User.new
    end

    def login
        _user = params[:user]
        is_user = User.find(:first, :conditions=>[ "mail=? and password=?", _user[:mail], _user[:password]])
        if is_user != nil
            _user.delete('password')
            _user[:firstname] = is_user[:firstname]
            _user[:lastname] = is_user[:lastname]
            session[:user] = _user
            redirect_to '/tweets'
        else
            #@login_user = User.new
            #@login_user.mail = _user['mail']
            msg = 'メールアドレスかパスワードが間違っています。'
            redirect_to root_path, notice: msg
        end
    end
end
