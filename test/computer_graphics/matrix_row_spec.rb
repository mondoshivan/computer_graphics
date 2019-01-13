
require 'computer_graphics/matrix_row'

describe MatrixRow do
  context "#size" do
    it 'gives the size' do
      row = MatrixRow.new(3,3,3)
      expect(row.size).to eq(3)
    end

    it 'gives the size' do
      row = MatrixRow.new([3,3,3])
      expect(row.size).to eq(3)
    end
  end
end
