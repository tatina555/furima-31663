class CreditController < ApplicationController
  def index
    @user_address = UserAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @user_address = UserAddress.new(credit_params)
    if @user_address.valid?
      @user_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def credit_params
    params.require(:user_address).permit(:postal_code, :country_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
