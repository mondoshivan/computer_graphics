
require 'computer_graphics/transform'

describe Transform do
  context '#add' do
    it 'adds a matrix' do
      t = Transform.new

      m = Matrix.new(
          MatrixRow.new(0),
          MatrixRow.new(0),
          MatrixRow.new(0)
      )

      t.add(m)
      expect(t.transformations.size).to eq(1)
    end

    it 'adds a matrix at beginning' do
      t = Transform.new

      m1 = Matrix.new(
          MatrixRow.new(0),
          MatrixRow.new(0),
          MatrixRow.new(0)
      )

      m2 = Matrix.new(
          MatrixRow.new(0),
          MatrixRow.new(0),
          MatrixRow.new(0)
      )

      t.add(m1)
      t.add(m2)
      expect(t.transformations.first == m2).to be_truthy
    end
  end
  context '#calculate' do
    it 'calculates the result' do
      t = Transform.new

      m1 = Matrix.new(
          MatrixRow.new(2,3,2),
          MatrixRow.new(2,0,0),
          MatrixRow.new(0,2,2)
      )

      m2 = Matrix.new(
          MatrixRow.new(2,4,0),
          MatrixRow.new(0,3,0),
          MatrixRow.new(2,0,2)
      )

      m3 = Matrix.new(
          MatrixRow.new(3,1,0),
          MatrixRow.new(2,0,4),
          MatrixRow.new(1,0,3)
      )

      result = Matrix.new(
          MatrixRow.new(42,18,12),
          MatrixRow.new(40,52,40),
          MatrixRow.new(24,36,28)
      )

      t.add(m1)
      t.add(m2)
      t.add(m3)

      expect(t.calculate == result).to be_truthy
    end
  end
end
