class Public::BoardsController < ApplicationController
    def index
      @boards = Board.all
    end  
    
    def new
      @board = Board.new
    end
    
    def create
      @board = Board.new(board_params)
      @board.menber_id = current_menber.id
      if @board.save
        redirect_to public_boards_path
      else
        render :new
      end
    end
    
    def show
      @board = Board.find(params[:id])
    end 
    
    private
    
    def board_params
      params.require(:board).permit(:menber_id, :title)
    end  
end
