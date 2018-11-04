# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    @cart.add_product(params[:product_id].to_i)
    redirect_to request.referer, notice: 'product added to cart'
  end
end
