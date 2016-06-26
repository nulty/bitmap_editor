module BitmapEditor
  class Bitmap
    VALID_DIMENSIONS = (1..250)

    def initialize(height, width)
      @height = height
      @width  = width
      validate_args
      @grid = new_grid
    end

    private

    attr_reader :width, :height

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
