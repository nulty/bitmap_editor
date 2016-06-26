module BitmapEditor
  class Bitmap
    def initialize(height, width)
      @grid = new_grid(height, width)
    end

    private

    def new_grid(height, width)
      Array.new(width) { Array.new(height, 'O') }
    end
  end
end
