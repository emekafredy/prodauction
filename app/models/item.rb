# frozen_string_literal: true

class Item < ApplicationRecord
  searchkick

  belongs_to :user
  belongs_to :category
  has_one :address
  has_one_attached :image
  has_many_attached :pictures

  enum status: %w[draft in_review published in_bid closed sold]
end
