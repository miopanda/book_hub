require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '本の新規登録' do
    context '新規登録できる場合' do
      it '条件を満たしていれば登録できる' do
        expect(@book).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'titleが空では登録できない' do
        @book.title = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Title can't be blank")
      end
    end
  end
end
