# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :require_authentication
  before_action :set_board, only: :show

  def index
    @boards = Board.all
  end

  def show; end

  def new
    @board = Board.new
  end

  def create
    @board =
      BoardCreateService
      .new(
        email: session[:email],
        name: board_params[:name],
        height: board_params[:height],
        width: board_params[:width],
        mine_count: board_params[:mine_count]
      )
      .execute!
    render_board
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def board_params
    params.require(:board).permit(:email, :name, :height, :width, :mine_count)
  end

  def render_board
    respond_to do |format|
      format.html { redirect_to @board, notice: 'Board was successfully created.' }
      format.json { render :show, status: :created, location: @board }
    end
  end
end
