# frozen_string_literal: true

class RenameCartItemsColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :cart_items, :quanity, :quantity
  end
end
