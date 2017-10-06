class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    if !Like.exists?(like_params.to_h)
      Like.create!(like_params)
      redirect_to(posts_path)
    else
      redirect_to(posts_path)
      flash[:notice] = "You have already liked this #{like_params[:contentable_type].downcase}"
    end
  end
  
  private
  
  def like_params
    params.require(:like).permit(:user_id, :contentable_id, :contentable_type)
  end
end
