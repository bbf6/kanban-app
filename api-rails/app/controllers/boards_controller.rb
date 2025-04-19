class BoardsController < ApplicationController
  before_action :find_board, only: %i[show update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: Board.all
  end

  def show
  end

  def create
    board = Board.new board_params
    return render status: :created if board.save
    render json: board.errors, status: :bad_request
  end

  def update
    return render json: @board if @board.update board_params
    render json: @board.errors, status: :bad_request
  end

  def destroy
    @board.destroy
  end

  private

  def find_board
    @board = Board.find params[:id]
  end

  def board_params
    params.require(:board).permit(:name, :background_id)
  end
end
