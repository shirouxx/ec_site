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
    redirect_to top_path, notice: 'カートに商品を入れました'
  end

  def update
    #@cart=はなくても良い
    session[:cart].delete_at(session[:cart].find_index(params[:id]))
    redirect_to cart_index_path
  end

  def destroy
    session[:cart] = [] #instead of reset_session
    redirect_to cart_index_path
  end

end
