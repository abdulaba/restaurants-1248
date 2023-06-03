class Restaurant < ApplicationRecord
  # Asociaciones
  has_many :dishes, dependent: :destroy
  # Linea tres me habilta lo sgte: 
  # @variable_restaurant.dishes.each do |dish|
  #   dish.name, dish.details, dish.price
  #end
  
  # Validaciones
  validates :name, :address, presence: true
  validates :name, length: {minimum: 6}
end
