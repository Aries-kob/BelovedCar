class Admin::BoardsController < ApplicationController
    def index
      @boards = Board.order(created_at: :desc).page(params[:page])
    end 
    
    def show
      @board = Board.find(params[:id])
    end
    
      private
    
    def board_params
      params.require(:board).permit(:menber_id, :title)
    end  
end
