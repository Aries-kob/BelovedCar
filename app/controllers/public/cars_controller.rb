class Public::CarsController < ApplicationController
  def new
    @car = Car.new
    @genres = Genre.all
  end
  
  def create
    @car = Car.new(car_parms)
    @genrs = Genre.all
    if @car.save
      redirect_to public_car_path(@car.id)
    else
      render :new
    end  
  end

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to public_car_path(@car.id)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to public_cars_path
  end
  
  private
  def car_params
    params.require(:car).permit(:menber_id, :name, :introduction, :image)
  end  
end
