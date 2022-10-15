class Public::CarsController < ApplicationController
  def new
    @car = Car.new
    @genres = Genre.all
  end
  
  def create
    @car = Car.new(car_params)
    @menber = current_menber
    @car.menber_id = current_menber.id
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
    @menber = Menber.find(@car.menber.id)
  end

  def edit
    @car = Car.find(params[:id])
    @genres = Genre.all
  end

  def update
    @car = Car.find(params[:id])
    @genres = Genre.all
    @car.update(car_params)
    redirect_to public_car_path(@car.id)
  end

  def destroy
    @car = Car.find(params[:id])
    if @car.destroy
      redirect_to public_cars_path
    else
      render :show
    end
  end
  
  private
  
  def car_params
    params.require(:car).permit(:menber_id, :name, :introduction, :car_image, genre_ids: [])
  end
  
  def article_params
    params.require(:article).permit(:name, genre_ids: [])
  end
  
end
