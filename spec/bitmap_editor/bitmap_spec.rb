require 'spec_helper'
require 'bitmap'

RSpec.describe BitmapEditor::Bitmap do
  describe 'initialize' do
    it 'raises noe error if dimensions are outside 1 to 250' do
      expect { described_class.new(1, 1) }.not_to raise_error
    end

    it 'raises error if dimensions are outside 1 to 250' do
      expect { described_class.new(1, 0) }.to raise_error(ArgumentError)
    end
  end
end
