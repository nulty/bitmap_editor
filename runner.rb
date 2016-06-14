Dir[Pathname.pwd.join('app/**/*.rb')].each { |f| require f }

BitmapEditor::Game.new.run
