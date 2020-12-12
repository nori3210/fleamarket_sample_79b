class HomesController < ApplicationController
  def index

    @items = Item.where(trading_status: '出品中')
  end

end
