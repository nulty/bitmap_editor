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

    def gets_input
      gets.chomp
    end
  end
end
