# == Schema Information
#
# Table name: mines
#
#  id         :uuid             not null, primary key
#  x_comp     :integer          not null
#  y_comp     :integer          not null
#  board_id   :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mine < ApplicationRecord
  belongs_to :board
end
