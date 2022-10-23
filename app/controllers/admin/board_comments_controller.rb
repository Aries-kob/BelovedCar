class Admin::BoardCommentsController < ApplicationController
    
  def destroy
    @board_comment = BoardComment.find(params[:id]).destroy
    @board = Board.find(params[:board_id])
    redirect_to admin_board_path(@board.id)
  end    
end
