# frozen_string_literal: true

class ChangeCartItemsQuantityDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :cart_items, :quantity, from: 0, to: 1
  end
end
