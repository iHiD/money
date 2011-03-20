class UsersController < ApplicationController
  
  skip_before_filter :redirect_unless_logged_in, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to overview_path, :notice => "You have successfully signed up!"
    else
      render "new"
    end
  end
  
end
