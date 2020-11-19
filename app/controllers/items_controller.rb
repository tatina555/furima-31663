class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index 
  end

  def create
  end

  def new
  end



  private

  def item_params
    params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
  end
end
