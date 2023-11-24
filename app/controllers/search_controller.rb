# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    search_params = params[:search].present? ? params[:search] : '*'
    category_id = params[:category].present? ? params[:category] : nil

    @items = if category_id
               Item.search(search_params,
                           fields: %w[name description category_id],
                           where: { category_id: })
             else
               Item.search(search_params, fields: %w[name description])
             end

    render turbo_stream:
      turbo_stream.update('items',
                          partial: 'items/items',
                          locals: { items: @items })
  end
end
