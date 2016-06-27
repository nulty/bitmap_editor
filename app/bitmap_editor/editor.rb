module BitmapEditor
  require 'command'
  require 'bitmap'

  class Editor
    attr_accessor :bitmap

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

    def gets_input
      gets.chomp
    end
  end

  class NoBitmapExistsError < StandardError
    def initialize(msg = 'Try creating a bitmap before clearing one')
      super(msg)
    end
  end
end
