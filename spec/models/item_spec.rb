require 'rails_helper'

describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @items.image = fixture_file_upload('app/assets/images/comment.png')
  end

  # 正常系

  context 'ユーザー登録ができる時' do
    it '全ての条件を満たす時' do
      expect(@item).to be_valid
    end
  end

  # 異常系

  context 'ユーザー登録ができない時' do
    describe 'ユーザー新規登録' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.catch_copy = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Catch copy can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.details_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Details category is not a number')
      end

      it '商品の状態についての情報が必須であること' do
        @item.details_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Details status is not a number')
      end

      it '配送料の負担についての情報が必須であること' do
        @item.delivery_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery burden is not a number')
      end

      it '発送元の地域についての情報が必須であること' do
        @item.delivery_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery source is not a number')
      end

      it '発送までの日数についての情報が必須であること' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day is not a number')
      end

      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥300以上あること' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格の範囲が、¥9,999,999以下あること' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '漢字ひらがなカタカナ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
