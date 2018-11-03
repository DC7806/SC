# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :cart, through: :cart_items, dependent: :destroy

  validates :name, :description, :price, presence: true
end
