# frozen_string_literal: true

class User < ApplicationRecord
  has_one :wallet
  has_many :items
  has_many :addresses
  has_one_attached :avatar

  validates :firstname, :lastname, presence: true
  validates_uniqueness_of :username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?
  after_create :create_user_wallet

  def set_default_role
    self.role ||= :user
  end

  def full_name
    "#{firstname} #{lastname}"
  end

  def create_user_wallet
    # allet.create_new_customer
    puts 'Creating new customer'
  end
end
