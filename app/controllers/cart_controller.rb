class CartController < ApplicationController
  # has_many :item カートはモデルじゃない
  def index
    @cart = Item.find(session[:cart])
  end

  def create
    session[:cart] = [] unless session[:cart]
    session[:cart] << params[:item_id]
    flash[:success] = "カートに追加できました！"
    redirect_to root_path
    # unless session[:cart]   #セッションにカートが無い場合
    #      session[:cart] = Cart.new　#新しいカートを追加
    # end
    # @item = Item.find(params[:id])
    # session[:cart] << @item
    # <% session[:cart] = nil %> session情報全て削除  index.html内に記述
  end

end
