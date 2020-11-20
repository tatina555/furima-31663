class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :create, :show]
  before_action :item_find, only:[:show, :edit, :update, :edit_to_index]
  before_action :edit_to_index, only: [:edit]


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(
      :image, :title, :catch_copy, :details_category_id, :details_status_id,
      :delivery_burden_id, :delivery_source_id, :delivery_day_id, :price
    ).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def edit_to_index
    redirect_to root_path unless current_user.id == item.user.id
  end
end
