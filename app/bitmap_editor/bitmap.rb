module BitmapEditor
  class Bitmap
    VALID_DIMENSIONS = (1..250)

    attr_reader :width, :height

    def initialize(height, width)
      @height = height.to_i
      @width  = width.to_i
      validate_args
      @grid = new_grid
    end

    def print(printer = ConsolePrinter)
      printer.print @grid
    end

    private

    def new_grid
      Array.new(width) { Array.new(height, 'O') }
    end

    def validate_args
      raise BitmapArgumentError unless valid_dimensions?
    end

    def valid_dimensions?
      VALID_DIMENSIONS.include?(height) && VALID_DIMENSIONS.include?(width)
    end
  end

  class BitmapArgumentError < StandardError
    def initialize(msg = 'dimensions should be integers between 1 and 250')
      super(msg)
    end
  end
end
