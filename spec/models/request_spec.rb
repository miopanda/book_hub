require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @request = FactoryBot.build(:request)
  end

  describe 'リクエストの新規投稿' do
    context '新規投稿ができる場合' do
      it "入力条件を満たしていれば登録できる" do
        expect(@request).to be_valid
      end
    end
    context '新規投稿ができない場合' do
      it 'messageが空では登録できない' do
        @request.message = ''
        @request.valid?
        expect(@request.errors.full_messages).to include("Message can't be blank")
      end
      it "request_type_idが1では登録できない" do
        @request.request_type_id = 1
        @request.valid?
        expect(@request.errors.full_messages).to include("Request type can't be blank")
      end
    end
  end
end
