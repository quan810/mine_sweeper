# frozen_string_literal: true

# == Schema Information
#
# Table name: mines
#
#  id         :uuid             not null, primary key
#  x_coor     :integer          not null
#  y_coor     :integer          not null
#  board_id   :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mine < ApplicationRecord
  belongs_to :board
  validates :x_coor, numericality: { greater_than: 0 }
  validates :y_coor, numericality: { greater_than: 0 }
  validates :board_id, uniqueness: { scope: %i[x_coor y_coor] }
  validate :validate_coor

  private

  def validate_coor
    errors.add(:x_coor) if x_coor > board.width
    errors.add(:y_coor) if y_coor > board.height
  end
end
