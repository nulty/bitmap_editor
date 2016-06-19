module BitmapEditor
  class Command
    attr_accessor :exit

    def run(command)
      function = command.split.shift

      case function
      when '?'
        show_help
      when 'X'
        exit_console
      else
        puts 'unrecognised command :('
      end
      self
    end

    def exit?
      !!exit
    end

    private

    def exit_console
      puts 'goodbye!'
      @exit = true
    end

    def show_help
      puts "? - Help
    I M N - Create a new M x N image with all pixels coloured white (O).
    C - Clears the table, setting all pixels to white (O).
    L X Y C - Colours the pixel (X,Y) with colour C.
    V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
    H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
    S - Show the contents of the current image
    X - Terminate the session"
    end
  end
end
