module BitmapEditor
  class ConsolePrinter
    public :print
    def self.print(grid)
      grid.each { |r| puts r.join }
    end
  end
end
