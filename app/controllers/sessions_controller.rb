class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params['email'], params['password'])
    
    session[:user] = @user.id if @user.present?
    redirect_to :back
  end
  
  def destroy
    session[:user] = nil
    
    redirect_to params['path']
  end
end