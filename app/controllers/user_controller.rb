class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @studies = @user.studies.includes(:user).order('created_at DESC')
  end
end
