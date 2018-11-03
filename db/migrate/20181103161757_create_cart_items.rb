class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :product, foreign_key: true
      t.references :cart, foreign_key: true
      t.decimal    :unit_price, precision: 10, scale: 2, null: false
      t.integer    :quanity, default: 0

      t.timestamps
    end
  end
end
