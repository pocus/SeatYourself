class UsersController < ApplicationController
  before_action :ensure_logged_in, only: [:show, :current]

  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save 
  		redirect_to restaurants_path
  	else
  		render :new
  	end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
  end

end
