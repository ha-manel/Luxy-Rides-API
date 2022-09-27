class UpdateForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :cars, :users
    add_foreign_key :cars, :users, on_delete: :cascade

    remove_foreign_key :reservations, :users
    add_foreign_key :reservations, :users, on_delete: :cascade

    remove_foreign_key :reservations, :cars
    add_foreign_key :reservations, :cars, on_delete: :cascade
  end
end
