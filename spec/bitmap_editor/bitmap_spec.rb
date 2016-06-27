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

  describe '#paint_pixel' do
    require 'printers/console_printer'
    let(:printer) { BitmapEditor::ConsolePrinter }
    let!(:bitmap) { described_class.new(4, 4) }

    context 'paint a pixel' do
      it 'paints a pixel' do
        expect($stdout).to receive(:puts).with('AOOO').once.ordered
        expect($stdout).to receive(:puts).with('OOOO').exactly(3).times.ordered

        bitmap.paint_pixel(1, 1, 'A')

        bitmap.print
      end
    end

    context 'paint a different pixel' do
      it 'paints a pixel' do
        expect($stdout).to receive(:puts).with('OOOO').exactly(2).times.ordered
        expect($stdout).to receive(:puts).with('OOAO').once.ordered
        expect($stdout).to receive(:puts).with('OOOO').once.ordered

        bitmap.paint_pixel(3, 3, 'A')

        bitmap.print
      end
    end
  end
end
