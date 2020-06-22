class StaticPagesController < ApplicationController
  before_action :logout

  def home; end

  private

  def logout
    redirect_to opinions_path if logged_in?
  end
end
