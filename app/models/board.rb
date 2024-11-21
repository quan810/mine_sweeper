# frozen_string_literal: true

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
  has_many :mines, dependent: :destroy

  validates :name, :email, presence: true
  validates :height, numericality: { greater_than: 0 }
  validates :width, numericality: { greater_than: 0 }
end
