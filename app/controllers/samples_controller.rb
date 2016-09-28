class SamplesController < ApplicationController
    before_action :logged_in_user, only: [:create]
    
    def create
      @sample = current_user.samples.build(samples_params)
      if @sample.save
        flash[:success] = "Tweet created"
        redirect_to root_url
      else 
        render 'static_pages/home'
      end
    end
    
    private
    def samples_params
      params.require(:sample).permit(:content)
    end
end
