# frozen_string_literal: true

class BoardCreateService
  def initialize(name:, height:, width:, email:, mine_count: 0)
    @name = name
    @height = height.to_i
    @width = width.to_i
    @email = email
    @mine_count = mine_count.to_i
    return unless @mine_count > @height * @width

    raise ActionController::BadRequest, 'Mines count must be less than available cell in board'
  end

  def execute!
    ActiveRecord::Base.transaction do
      Board.create!(
        name: @name,
        email: @email,
        height: @height,
        width: @width
      ).tap(&method(:create_mines))
    end
  end

  private

  def create_mines(board)
    mines =
      (0...@width * @height)
      .to_a
      .sample(@mine_count)
      .map do |position|
        x_coor = (position % @width) + 1
        y_coor = (position / @width) + 1
        board.mines.build(x_coor:, y_coor:)
      end
    Mine.import!(mines, batch_size: 500)
  end
end
