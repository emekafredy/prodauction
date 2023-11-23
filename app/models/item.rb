# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :address, optional: true
  has_one_attached :image
  has_many_attached :pictures
end
