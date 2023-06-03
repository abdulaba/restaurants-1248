class RestaurantsController < ApplicationController
  
  #GET /restaurants
  def index
    @restaurants = Restaurant.all
    # construye un ARRAY DE INSTANCIAS
    # [0x000404ab, 0x0jfjfhfhf]
  end

  #GET /restaurants/:id
  def show
    @restaurant = Restaurant.find(params[:id])
    # Me trae una instancia
  end

  #GET /restaurants/new
  def new
    # El proposito de new es crear una instancia VACIA para poder usarla en un formulario en la vista NEW
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: "El restaurante se ha creado correctamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /restaurants/:id/edit
  def edit
    # El proposito de edit es crear una instancia con un id extraido de params para poder usarla 
    # en un formulario en la vista EDIT
    @restaurant = Restaurant.find(params[:id])
  end

  # PATCH /restaurants/:id/
  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id), notice: "El restaurante se ha actualizado correctamente"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name,:address) # name: params[:name], address: params[:address]
  end
end
