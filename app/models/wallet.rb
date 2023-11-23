# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :user

  def create_new_customer
    puts 'Creating new customer'
  end
end
