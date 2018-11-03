# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items, dependent: :destroy

  def add_product
    item = cart_items.find_by(product_id: params[:id])

    if item
      item.quantity += 1
      item.save
    else
      cart_items.create(cart_id: id,
                        product_id: params[:id])
    end
  end

  def delete_product; end
end
