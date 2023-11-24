# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new; end

  def create; end

  def show; end

  def update; end

  def destroy; end

  private

  def item_params
    params.require(:item).permit(:name, :description, :starting_price, :state, :country, :category_id,
                                 :bid_start_time, :bid_end_time, :delivery_options, :image, pictures: [])
  end
end
