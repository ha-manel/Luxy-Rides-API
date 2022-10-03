class AddPriceToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :price, :decimal
  end
end
