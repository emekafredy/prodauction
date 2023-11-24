# frozen_string_literal: true

class Item < ApplicationRecord
  searchkick

  belongs_to :user
  belongs_to :category
  has_one :address
  has_many_attached :pictures

  validates :name, :description, :bid_start_time, :bid_end_time,
            :starting_price, :state, :delivery_options, :pictures, presence: { message: 'is required' }

  validates :starting_price, numericality: { greater_than: 0 }
  validate :date_config

  scope :available, -> { where(status: %w[published in_bid]) }

  enum status: %w[draft in_review published in_bid closed sold]

  def thumbnail
    pictures[0] if pictures
  end

  def date_deficit?
    return false if bid_end_time.nil? || bid_start_time.nil?

    bid_end_time < bid_start_time
  end

  def date_too_early?
    return false if bid_start_time.nil?

    bid_start_time < DateTime.now
  end

  def date_config
    errors.add(:bid_start_time, 'must be earlier than the Bid end time') if date_deficit?
    errors.add(:bid_start_time, 'must be a future time') if date_too_early?
  end
end
