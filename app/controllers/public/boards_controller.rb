class Public::BoardsController < ApplicationController
    def index
      @boards = Board.all.order(created_at: :desc)
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
      @board_comment = BoardComment.new
    end 
    
    private
    
    def board_params
      params.require(:board).permit(:menber_id, :title)
    end  
end
