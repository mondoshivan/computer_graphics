
class MatrixRow

  attr_reader :row

  #########################
  def initialize(*args)
    return if args.empty?
    if args[0].kind_of?(Array)
      @row = args[0]
    else
      @row = args
    end
  end

  #########################
  def size
    @row.size
  end

  #########################
  def to_s
    @row.inspect
  end

end