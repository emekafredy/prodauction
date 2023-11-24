# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index my_listings]
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.available
                 .where('bid_end_time > ?', DateTime.now)
  end

  def new
    @mode = 'New'
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.delivery_options = params[:item][:delivery_options]
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit
    @mode = 'Edit'
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_listings
    @items = Item
             .where(user_id: current_user.id)
             .where('bid_end_time > ?', DateTime.now)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :starting_price, :state, :country, :category_id,
                                 :bid_start_time, :bid_end_time, :delivery_options, pictures: [])
  end
end
