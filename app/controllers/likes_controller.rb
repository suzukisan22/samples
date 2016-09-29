class LikesController < ApplicationController
  def like
    @sample = Sample.find(params[:sample_id])
    like = current_user.likes.build(sample_id: @sample.id)
    like.save
    redirect_to :back
  end
  
  def unlike
    @sample = Sample.find(params[:sample_id])
    like = current_user.likes.find_by(sample_id: @sample.id)
    like.destroy
    redirect_to :back
  end
end
