class ItemsController < ApplicationController
  before_action :authenticate_user! except: [:index]

  def index
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :title, :catch_copy, :details_category_id, :details_status_id,
      :delivery_burden_id, :delivery_source_id, :delivery_day_id, :price
    ).merge(user_id: current_user.id)
  end
end
