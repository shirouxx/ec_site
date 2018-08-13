class CartController < ApplicationController
  # has_many :item カートはモデルじゃない
  def index
    if session[:cart] != nil
      session[:cart].sort!
      @cart = session[:cart].map { |item_id| Item.find(item_id) }
    end
  end

  def create
    session[:cart] = [] unless session[:cart]
    session[:cart] << params[:item_id]
    redirect_to root_path, notice: 'カートに商品を入れました'
    # unless session[:cart]   #セッションにカートが無い場合
    #      session[:cart] = Cart.new　#新しいカートを追加
    # end
    # @item = Item.find(params[:id])
    # session[:cart] << @item
    # <% session[:cart] = nil %> session情報全て削除  index.html内に記述
  end

end
