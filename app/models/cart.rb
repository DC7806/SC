# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items, dependent: :destroy

  def add_product(product_id)
    item = cart_items.find_by(product_id: product_id)
    product_price = Product.find(product_id).price

    if item
      item.quantity += 1
      item.save
    else
      cart_items.create(cart_id: id,
                        product_id: product_id,
                        unit_price: product_price)
    end
  end

  def delete_product; end
end
