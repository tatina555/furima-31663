class CreditController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @user_address = UserAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: params[:token],
    currency: 'jpy'
    )
  end
end
