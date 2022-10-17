class Public::BoardCommentsController < ApplicationController
  
  def create
    @board = Board.find(params[:board_id])
    @board_comment = current_menber.board_comments.new(board_comment_params)
    @board_comment.board_id = @board.id
    @board_comment.save
    redirect_to public_board_path(@board.id)
  end
  
  def destroy
    @board_comment = BoardComment.find(params[:id]).destroy
    @board = Board.find(params[:board_id])
    redirect_to public_board_path(@board.id)
  end
  
  private
  
  def board_comment_params
    params.require(:board_comment).permit(:body, :board_id)
  end   
end
