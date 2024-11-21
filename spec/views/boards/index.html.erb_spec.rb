# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'boards/index', type: :view do
  before(:each) do
    assign(:boards, [
             Board.create!,
             Board.create!
           ])
  end

  it 'renders a list of boards' do
    render
    'div>p'
  end
end
