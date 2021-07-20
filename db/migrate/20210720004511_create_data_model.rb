class CreateDataModel < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name, unique: true
      t.timestamps
    end

    create_table :drinks do |t|
      t.string :name, unique: true
      t.decimal :price
      t.timestamps
    end

    create_table :drink_ingredients do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :drink, null: false, foreign_key: true
      t.integer :grams
    end

    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, unique: true
      t.bigint :favorite_drink_id
      t.timestamps
    end

    add_foreign_key :customers, :drinks, column: :favorite_drink_id, on_delete: :nullify

    create_table :sales do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :drink, null: false, foreign_key: true
      t.decimal :price, null: false
      t.decimal :tax, null: false
      t.decimal :total, null: false
      t.timestamps
    end
  end
end
