# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :items, dependent: :destroy

  validates_uniqueness_of :name
end
