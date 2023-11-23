# frozen_string_literal: true

class ItemsController < ApplicationController
  def index; end

  def new; end

  def create; end

  def show; end

  def update; end

  def destroy; end

  private

  def item_params
    params.require(:item).permit(:image, )
  end
end