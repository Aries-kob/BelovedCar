class Public::MenbersController < ApplicationController
    
  def index
    @menbers = Menber.all
  end
    
  def show
    @menber = Menber.find(params[:id])
    @cars = @menber.cars
  end
    
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def menber_params
    params.require(:menber).permit(:name, :nickname, :introduction, :area, :profile_image) 
  end  
  
end