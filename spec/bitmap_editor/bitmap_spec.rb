require 'spec_helper'
require 'bitmap'

RSpec.describe BitmapEditor::Bitmap do
  describe 'initialize' do
    describe 'validate dimensions' do
      it 'raises no error if dimensions are outside 1 to 250' do
        expect { described_class.new(1, 1) }.not_to raise_error
      end

      it 'raises error if dimensions are outside 1 to 250' do
        expect { described_class.new(1, 0) }.to raise_error(BitmapEditor::BitmapArgumentError)
      end

      it 'raises error if dimensions are not castable to Integer' do
        expect { described_class.new('d', 0) }.to raise_error(BitmapEditor::BitmapArgumentError)
      end
    end
  end
end
