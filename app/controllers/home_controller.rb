class HomeController < ApplicationController
  # # 取得したデータを新規順に表示
  #  default_scope -> { order(created_at: :desc) }
  def top
    @items = Item.all.order(:created_at)
  end
end
