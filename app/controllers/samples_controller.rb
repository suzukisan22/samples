class SamplesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :liking_user]
    
  def search
    @sample = Sample.new
  end
    
  def result
    prm = Sample.new(samples_params)
    @samples = Sample.where("content like '%" + prm[:content] + "%'")
    if @sample
      render :template => "samples/result_all"
    else
      flash[:info] = "お探しのツイートはありません。"
      redirect_to search_samples_path
    end
  end
    
  def like_user
    @sample = Sample.find(params[:id])
    @users = @sample.like_users
  end
    
  def create
    @sample = current_user.samples.build(samples_params)
    if @sample.save
      flash[:success] = "Tweet created"
      redirect_to root_url
    else 
      render 'static_pages/home'
    end
  end
    
  def destroy
    @sample = current_user.samples.find_by(id: params[:id])
    return redirect_to root_url if @sample.nil?
    @sample.destroy
    flash[:success] = "Tweet deleted"
    redirect_to request.referer || root_url
  end
    
  private
    def samples_params
      params.require(:sample).permit(:content)
    end
end
