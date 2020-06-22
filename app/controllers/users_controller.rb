class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Successfully signed up!'
      log_in @user
      redirect_to root_path
    else
      flash.now[:danger] = 'Sign up failed!'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions.all.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      redirect_to root_path
    else
      flash[:danger] = "You shouldn't be doing this!"
      redirect_to opinions_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :photo, :cover_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(opinions_url) unless current_user == @user
  end
end
