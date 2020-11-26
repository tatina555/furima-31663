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
    it '郵便番号が空では登録できない' do
      @useraddress.postal_code = ""
      @useraddress.valid?
      expect(@useraddress.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県が空では登録できない' do
      @useraddress.country_id = ""
      @useraddress.valid?
      expect(@useraddress.errors.full_messages).to include("Country can't be blank")
    end

    it '市町村が空では登録できない' do
      @useraddress.city = ""
      @useraddress.valid?
      expect(@useraddress.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では登録できない' do
      @useraddress.address = ""
      @useraddress.valid?
      expect(@useraddress.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では登録できない' do
      @useraddress.phone_number = ""
      @useraddress.valid?
      expect(@useraddress.errors.full_messages).to include("Phone number can't be blank")
    end

    it '郵便番号に-が必要であること' do
      @useraddress.postal_code = "1112222"
      @useraddress.valid?
      expect(@useraddress.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @useraddress.phone_number = "080-1111-2222"
      @useraddress.valid?
      binding.pry
      expect(@useraddress.errors.full_messages).to include("Phone number 電話番号はハイフンなしの１１桁です")
    end

  end
end

  end
end