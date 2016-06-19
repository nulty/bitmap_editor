module BitmapEditor
  require_relative 'command'
  class Editor
    def run
      puts 'type ? for help'

      loop do
        print '> '
        input = gets_input
        break if command(input).exit?
      end
    end

    def command(input)
      Command.new.run(input)
    end

    def gets_input
      gets.chomp
    end
  end
end
