Dir[Dir.pwd.concat('/app/**/*.rb')].each { |f| require f }

BitmapEditor::Editor.new.run
