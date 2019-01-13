
require 'computer_graphics/matrix'

describe Matrix do
  context '#equal operator overloading' do
    context 'is equal' do
      it 'has same values' do
        m1 = Matrix.new(
            MatrixRow.new(0),
            MatrixRow.new(0),
            MatrixRow.new(0)
        )

        expect(m1 == m1).to be_truthy

        m1 = Matrix.new(
            MatrixRow.new(0,1),
            MatrixRow.new(0,1),
            MatrixRow.new(0,1)
        )

        expect(m1 == m1).to be_truthy
      end
    end
    context 'is not equal' do
      it 'has row mismatch' do
        m1 = Matrix.new(
            MatrixRow.new(0),
            MatrixRow.new(0),
            MatrixRow.new(0)
        )

        m2 = Matrix.new(
            MatrixRow.new(0),
            MatrixRow.new(0)
        )

        expect(m1 == m2).to be_falsey
      end

      it 'has column mismatch' do
        m1 = Matrix.new(
            MatrixRow.new(0,0),
            MatrixRow.new(0,0),
            MatrixRow.new(0,0)
        )

        m2 = Matrix.new(
            MatrixRow.new(0),
            MatrixRow.new(0),
            MatrixRow.new(0)
        )

        expect(m1 == m2).to be_falsey
      end

      it 'has different values' do
        m1 = Matrix.new(
            MatrixRow.new(0),
            MatrixRow.new(1),
            MatrixRow.new(2)
        )

        m2 = Matrix.new(
            MatrixRow.new(0),
            MatrixRow.new(0),
            MatrixRow.new(0)
        )

        expect(m1 == m2).to be_falsey

        m1 = Matrix.new(
            MatrixRow.new(0,0),
            MatrixRow.new(0,0)
        )

        m2 = Matrix.new(
            MatrixRow.new(0,0),
            MatrixRow.new(0,1)
        )

        expect(m1 == m2).to be_falsey
      end
    end
  end
  context '#multiply' do
    it '' do
      m1 = Matrix.new(
          MatrixRow.new(1,0,0),
          MatrixRow.new(0,1,0),
          MatrixRow.new(0,0,1)
      )

      m2 = Matrix.new(
          MatrixRow.new(1,0,1),
          MatrixRow.new(0,1,1),
          MatrixRow.new(0,0,1)
      )

      expected = Matrix.new(
          MatrixRow.new(1,0,1),
          MatrixRow.new(0,1,1),
          MatrixRow.new(0,0,1)
      )

      expect(m1 * m2 == expected).to be_truthy
    end

    it 'handles square' do
      m1 = Matrix.new(
          MatrixRow.new(1,0,0),
          MatrixRow.new(0,1,0),
          MatrixRow.new(0,0,1)
      )

      m2 = Matrix.new(
          MatrixRow.new(1,0,1),
          MatrixRow.new(0,1,1),
          MatrixRow.new(0,0,1)
      )

      expected = Matrix.new(
          MatrixRow.new(1,0,1),
          MatrixRow.new(0,1,1),
          MatrixRow.new(0,0,1)
      )

      expect(m1 * m2 == expected).to be_truthy

      m1 = Matrix.new(
          MatrixRow.new(3,4,4),
          MatrixRow.new(2,31,0),
          MatrixRow.new(3,0,21)
      )

      m2 = Matrix.new(
          MatrixRow.new(1,2,1),
          MatrixRow.new(0,21,0),
          MatrixRow.new(3,0,1)
      )

      expected = Matrix.new(
          MatrixRow.new(15,90,7),
          MatrixRow.new(2,655,2),
          MatrixRow.new(66,6,24)
      )

      expect(m1 * m2 == expected).to be_truthy

      m1 = Matrix.new(
          MatrixRow.new(3,4,4),
          MatrixRow.new(2,31,0),
          MatrixRow.new(3,0,21)
      )

      m2 = Matrix.new(
          MatrixRow.new(1,2,1),
          MatrixRow.new(0,21,0),
          MatrixRow.new(3,0,1)
      )

      expected = Matrix.new(
          MatrixRow.new(10,66,25),
          MatrixRow.new(42,651,0),
          MatrixRow.new(12,12,33)
      )

      expect(m2 * m1 == expected).to be_truthy
    end

    it 'handles not square' do
      m1 = Matrix.new(
          MatrixRow.new(1,2,1),
          MatrixRow.new(0,21,0),
          MatrixRow.new(3,0,1)
      )

      m2 = Matrix.new(
          MatrixRow.new(3,4,4,8),
          MatrixRow.new(2,31,0,9),
          MatrixRow.new(3,0,21,10)
      )

      expected = Matrix.new(
          MatrixRow.new(10,66,25,36),
          MatrixRow.new(42,651,0,189),
          MatrixRow.new(12,12,33,34)
      )

      expect(m1 * m2 == expected).to be_truthy
    end
  end
end
