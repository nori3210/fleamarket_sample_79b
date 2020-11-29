class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  def new
    @item = Item.new
    @images = @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    render layout: 'application'
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      alert('削除できませんでした')
    end
  end

  private

    def item_params
       params.require(:item).permit(:name, :item_description,  :brand_id, :size_id, :item_condition_id, :postage_type_id, :postage_payer_id, :prefecture_id, :estimated_shipping_date_id, :price, item_images_attributes: [:src]).merge(trading_status:"出品中")
    end

    def set_item
      @item = Item.find(params[:id])
    end

  end