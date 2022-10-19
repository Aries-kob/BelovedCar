# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  def after_sign_out_path_for(resource)
    new_menber_session_path
  end 
  
  def guest_sign_in
    menber = Menber.guest
    sign_in menber
    redirect_to public_menber_path(menber), notice: 'ゲストアカウントでログインしました'
  end  
  
  protected
  
  def reject_menber
    @menber = Menber.find_by(email: params[:menber][:email])
    if @menber
      if @menber.valid_password?(params[:menber][:password]) && (@menber.status == false)
        flash[:notice] = "退会済みです。再度ご登録ください。"
        redirect_to new_menber_registration_path
      else
        flash[:notice] = "項目を入力して下さい"
      end
    end
  end  

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
