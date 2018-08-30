class HomeController < ApplicationController
  before_action :authenticate_user!, only: :top

  # # 取得したデータを新規順に表示
  #  default_scope -> { order(created_at: :desc) }
  def index

  end

  def top
    @items = Item.all.order(:created_at)
  end
end
