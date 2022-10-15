class Public::MenbersController < ApplicationController
    
  def index
    @menbers = Menber.all
  end
    
  def show
    @menber = Menber.find(params[:id])
    @cars = @menber.cars
  end
    
  def edit
    @menber = current_menber
  end
  
  def update
    @menber = Menber.find(params[:id])
    @menber.update(menber_params)
    redirect_to public_menber_path(@menber.id)
  end
  
  def destroy
  end
  
  private
  
  def menber_params
    params.require(:menber).permit(:name, :nickname, :introduction, :area, :profile_image) 
  end  
  
end
