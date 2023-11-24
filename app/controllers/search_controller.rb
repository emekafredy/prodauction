# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    search_params = params[:search].present? ? params[:search] : '*'
    category_id = params[:category].present? ? params[:category] : nil

    @items = if category_id
               Item.search(search_params,
                           fields: %w[name description category_id status],
                           where: { category_id:, status: %w[published in_bid] })
             else
               Item.search(search_params, 
                           fields: %w[name description status],
                           where: { category_id:, status: %w[published in_bid] })
             end

    render turbo_stream:
      turbo_stream.update('items',
                          partial: 'items/items',
                          locals: { items: @items })
  end
end
