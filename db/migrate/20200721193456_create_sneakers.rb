class CreateSneakers < ActiveRecord::Migration
  def change
    create_table :sneakers do |t|
      t.string :sneaker_name
      t.integer :sneaker_price
      t.string :sneaker_brand
    end
  end
end
