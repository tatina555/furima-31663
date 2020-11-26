class CreditController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_find, only: [:index, :create]
  before_action :index_only_to_index, only: [:index]

  def index
    @user_address = UserAddress.new
  end

  def create
    @user_address = UserAddress.new(credit_params)
    if @user_address.valid?
      pay_item
      @user_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def credit_params
    params.require(:user_address).permit(:postal_code, :country_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def index_only_to_index
    redirect_to root_path if current_user.id == @item.user.id
  end
end
