class Admin::MenbersController < ApplicationController
  
  def index
    @menbers = Menber.all
    
  end

  def show
    @menber = Menber.find(params[:id])
    @cars = @menber.cars
  end

  def edit
    @menber = Menber.find(params[:id])
  end

  def update
    @menber = Menber.find(params[:id])
    @menber.update(menber_params)
    redirect_to admin_menber_path
  end
  
  private
  
  def menber_params
    params.require(:menber).permit(:name, :nickname, :introduction, :area, :status, :profile_image) 
  end  
  
  
end
