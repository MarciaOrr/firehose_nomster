class UsersController < ApplicationController
  include UsersHelper
  
  def show
    @user = User.find(params[:id])
  end
end
