require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  describe 'テストの対象' do
   before do
    @useraddress = FactoryBot.build(:user_address)
   end

  # 正常系

  context '商品購入ができる時' do
    it '全ての条件を満たす時' do
      expect(@useraddress).to be_valid
    end
  end


 # 異常系

 context '商品購入ができない時' do
  describe '商品購入' do



  end
end

  end
end
