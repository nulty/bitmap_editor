module BitmapEditor
  require 'command'
  require 'bitmap'

  class Editor
    attr_reader :bitmap

    def run
      puts 'type ? for help'

      loop do
        print '> '
        input = gets_input

        break if command(input).exit?
      end
    end

    def command(input)
      Command.new.run(input, self)
    end

    def new_bitmap(height, width)
      @bitmap = ::BitmapEditor::Bitmap.new(height, width)
    end

    def clean_bitmap
      raise NoBitmapExistsError if bitmap.nil?

      @bitmap = new_bitmap(bitmap.height, bitmap.width)
    end

    def print_bitmap
      raise NoBitmapExistsError if bitmap.nil?

      bitmap.print
    end

    def paint_pixel(col, row, colour)
      raise NoBitmapExistsError if bitmap.nil?

      bitmap.paint_pixel(col, row, colour)
    end

    def paint_vertical(col, row_start, row_end, colour)
      raise NoBitmapExistsError if bitmap.nil?

      bitmap.paint_vertical(col, row_start, row_end, colour)
    end

    def paint_horizontal(col_start, col_end, row, colour)
      raise NoBitmapExistsError if bitmap.nil?

      bitmap.paint_horizontal(col_start, col_end, row, colour)
    end

    def gets_input
      gets.chomp
    end
  end

  class NoBitmapExistsError < StandardError
    def initialize(msg = 'Try creating a bitmap first')
      super(msg)
    end
  end
end
