class RequestType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '本の購入リクエスト' },
    { id: 3, name: '貸出・返却に関する問い合わせ' },
    { id: 4, name: 'その他 お問合せ' }
  ]

  include ActiveHash::Associations
  has_many :requests
  end