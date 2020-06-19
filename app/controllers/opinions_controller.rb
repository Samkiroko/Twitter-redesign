class OpinionsController < ApplicationController
  before_action :require_login

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.new(opinion_params)
    if @opinion.save
      redirect_to opinions_path
    else
      redirect_to request.referrer
    end
  end

  def index
    @opinion = current_user.opinions.build if current_user
  end

  def discover
    @not_followed = User.not_following_opinions(current_user)
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end

  def require_login
    return if logged_in?

    flash[:danger] = 'You must be logged in to access this section'
    redirect_to root_path
  end
end
