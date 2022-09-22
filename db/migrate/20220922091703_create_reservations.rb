class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :date
      t.string :city
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :car, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
