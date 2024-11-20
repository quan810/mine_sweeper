# == Schema Information
#
# Table name: boards
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  email      :string           not null
#  height     :integer          not null
#  width      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ApplicationRecord
  has_many :mines
end