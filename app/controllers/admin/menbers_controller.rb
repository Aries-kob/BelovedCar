class Admin::MenbersController < ApplicationController
  
  before_action :ensure_guest_menber, only[:edit]
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
  
  def ensure_guest_menber
    @menber = Menber.find(params[:id])
    if @menber.name == "guestmenber"
      redirect_to public_menber_path(current_menber), notice: 'ゲストユーザーは編集画面へは入れません。'
    end
  end  
end
