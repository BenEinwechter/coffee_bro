class Customer < ApplicationRecord
  has_many :sales
  belongs_to(
    :favorite_drink,
    foreign_key: :favorite_drink_id,
    optional: true,
    class_name: 'Drink'
  )
end
