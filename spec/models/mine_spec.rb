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
# Indexes
#
#  index_mines_on_board_id_and_x_coor_and_y_coor  (board_id,x_coor,y_coor) UNIQUE
#

require 'rails_helper'

RSpec.describe Mine, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
