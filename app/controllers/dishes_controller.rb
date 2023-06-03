class DishesController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = Dish.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id]) # Busco el id de restaurant
    @dish = Dish.new(dish_params) # Creo el dish con los datos del formulario
    @dish.restaurant_id = @restaurant.id # en la variable Dish le incorporo el id de restaurant
    if @dish.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def dish_params
    params.require(:dish).permit(:name, :detail, :price)
  end
end
