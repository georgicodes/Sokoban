require_relative 'spec_helper'

describe "Gameboard" do

  before :each do
    board = []
    row1 = ["#", "#", "#", "#", "#"]
    row2 = ["#", ".", "o", "@", "#"]
    board << row1
    board << row2
    board << row1
    @gameboard = Gameboard.new(board)
  end

  # describe "#get_position_after_move" do
  #   it "returns nil when left position is off the grid" do
  #     expect(@gameboard.get_position_after_move(:left)).to be nil
  #   end
  # end

  describe "#get_position_after_move" do
    it "returns o when getting left position" do
      expect(@gameboard.get_cell_after_move(:left)).to eq "o"
    end

    it "returns # when getting right position" do
      expect(@gameboard.get_cell_after_move(:right)).to eq "#"
    end

    it "returns # when getting up position" do
      expect(@gameboard.get_cell_after_move(:up)).to eq "#"
    end

    it "returns # when getting up position" do
      expect(@gameboard.get_cell_after_move(:down)).to eq "#"
    end
  end

  describe "#get_position_after_move" do

  end

end