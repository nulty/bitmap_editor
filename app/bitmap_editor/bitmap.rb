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

    def paint_pixel(col, row, colour)
      col = col.to_i - 1
      row = row.to_i - 1
      @grid[col][row] = colour.upcase
    end

    def paint_vertical(col, row_start, row_end, colour)
      row_start = row_start.to_i
      row_end   = row_end.to_i
      col       = col.to_i

      (row_start..row_end).each do |row_pixel|
        paint_pixel(row_pixel, col, colour)
      end
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
