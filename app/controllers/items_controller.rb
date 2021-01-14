class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy, :show]

  def new
    @item = Item.new
    @images = @item.item_images.build

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
  end
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # ここでfind_byを使うことでレディーしか取れてなかった
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  def create
    if user_signed_in?
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def edit
    @item.item_images.build
    render layout: 'application'
    grandchild_category = @item.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end

  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      @item.item_images.build
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

  def show

  end

  def index
  end
  

  private

    def item_params
       params.require(:item).permit(:name, :item_description,  :brand_id, :category_id, :size_id, :item_condition_id, :postage_type_id, :postage_payer_id, :prefecture_id, :estimated_shipping_date_id, :price, item_images_attributes: [:id, :src, :_destroy]).merge(user_id: current_user.id,trading_status:"出品中")
    end

    def set_item
      @item = Item.find(params[:id])
    end

  end