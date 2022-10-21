class Admin::CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
    @genres = Genre.all
  end

  def update
    @car = Car.find(params[:id])
    @genres = Genre.all
    @car.update(car_params)
    redirect_to admin_car_path(@car.id)
  end
  
  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to admin_cars_path
  end
  
  private
  
  def car_params
    params.require(:car).permit(:menber_id, :name, :introduction, :car_image, genre_ids: [])
  end
  
  def article_params
    params.require(:article).permit(:name, genre_ids: [])
  end
end
