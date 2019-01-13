
class Matrix

  attr_reader :rows

  #####################
  def initialize(*args)
    if args.size == 2 && args[0].kind_of?(Integer) && args[1].kind_of?(Integer)
      @rows = create_rows(args[0], args[1])
    elsif args[0].kind_of?(MatrixRow)
      @rows = args
    end
  end

  private

  #####################
  def create_rows(rows, columns)
    rows.times.map{
      create_row(columns)
    }
  end

  #####################
  def create_row(columns)
    array = columns.times.map{0}
    MatrixRow.new(array) # create 0 values for each column
  end

  #####################
  def matrix_multiply(matrix)
    result = Matrix.new(@rows.size, matrix.columns)
    matrix.columns.times.each_with_index {|a, column_index|
      @rows.each_with_index {|self_matrix_row, row_index|
        value = 0
        self_matrix_row.row.each_with_index {|self_row_item, row_item_index|
          value += self_row_item * matrix.get_value(row_item_index, column_index)
        }
        result.set_value(
            row_index,
            column_index,
            value
        )
      }
    }
    result
  end

  public

  #####################
  def columns
    return 0 if @rows.size == 0
    @rows[0].size
  end

  #####################
  def get_value(row, column)
    @rows[row].row[column]
  end

  #####################
  def set_value(row, column, value)
    @rows[row].row[column] = value
  end

  #####################
  def *(multiplier)
    matrix_multiply(multiplier) if multiplier.kind_of?(Matrix)
  end

  #####################
  def ==(matrix)
    return false unless @rows.size == matrix.rows.size
    return false unless @rows[0].row.size == matrix.rows[0].row.size
    @rows.each_with_index {|matrix_row, row_index|
      matrix_row.row.each_with_index {|matrix_row_item, column_index|
        return false unless matrix_row_item == matrix.get_value(row_index, column_index)
      }
    }
    true
  end

  #####################
  def to_s
    @rows.join("\n")
  end

end