class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :limit]
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC').page(params[:page]).per(16)
  end

  def limit
    @items = Item.includes(:allergies).where("allergies.id":1..7)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user).order('created_at DESC')
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
    redirect_to root_path unless current_user == @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text, allergy_ids: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
