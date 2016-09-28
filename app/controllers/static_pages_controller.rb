class StaticPagesController < ApplicationController
  def home
    @sample = current_user.samples.build if logged_in?
  end
end
