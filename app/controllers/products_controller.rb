# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    load_products
  end

  def show
    load_product
  end

  def new
    load_product
  end

  def create
    build_product
    save_product
  end

  def edit
    load_product
  end

  def update
    load_product
    save_product
  end

  def destroy
    load_product
    delete_product
  end

  private

  def load_products
    @products = Product.order(id: :desc)
  end

  def load_product
    @product = params[:id].nil? ? Product.new : Product.find(params[:id])
  end

  def build_product
    @product = Product.new(product_params)
  end

  def save_product
    @product.attributes = product_params

    if @product.save
      redirect_to products_path, notice: 'Product Created'
    else
      render :new
      flash[:alert] = 'Something Went Wrong'
    end
  end

  def delete_product
    @product.destroy
    redirect_to products_path, notice: 'Product Deleted'
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :published)
  end
end
